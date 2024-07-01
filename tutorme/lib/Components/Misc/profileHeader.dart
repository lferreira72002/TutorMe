import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tutorme/Controllers/userController.dart';
import 'package:tutorme/main.dart';

class Profileheader extends StatelessWidget {
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff31704A),
      padding: EdgeInsets.all(16.0),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: Obx(
                          () => CircleAvatar(
                            backgroundColor: Color(0xffFFFCF1),
                            backgroundImage: userController
                                    .profileURL.isNotEmpty
                                ? NetworkImage(userController.profileURL.value)
                                : null,
                            child: userController.profileURL.isEmpty
                                ? Icon(Icons.cloud_upload_outlined)
                                : null, // Replace with your avatar image URL
                            radius: 24.0,
                          ),
                        ),
                        onTap: () async {
                          uploadProfilePicture();
                        },
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'G’day',
                            style: TextStyle(
                                color: Color(0xffFFFCF1), fontSize: 18.0),
                          ),
                          Text(
                            userController.userName.value,
                            style: TextStyle(
                                color: Color(0xffFFFCF1),
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.notifications, color: Color(0xffFFFCF1)),
                      15.horizontalSpace,
                      GestureDetector(
                        child: Icon(Icons.logout, color: Color(0xffFFFCF1)),
                        onTap: () {
                          signOut();
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signOut() {
    supabase.auth.signOut();
    Get.offAllNamed('/login');
  }

  Future<String?> uploadProfilePicture() async {
    final imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageFile == null) {
      return null;
    }

    try {
      final bytes = await imageFile.readAsBytes();
      final fileExt = imageFile.path.split('.').last;
      print(fileExt);
      final fileName =
          '${supabase.auth.currentUser!.id}_profilepicture.${fileExt}';
      final filePath = fileName;
      print(filePath);

      //check to see if file exits already
      final doesExist = await doesFileExist(filePath);
      if (doesExist) {
        await supabase.storage.from('profileImages').remove([fileName]);
      }

      //upload the file
      await supabase.storage.from('profileImages').uploadBinary(
            filePath,
            bytes,
            fileOptions: FileOptions(contentType: imageFile.mimeType),
          );

      //create a url for the image
      final imageUrlResponse = await supabase.storage
          .from('profileImages')
          .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);

      //update the user metadata with the URL image & update our own controller
      userController.updateProfileURL(imageUrlResponse);
    } catch (e) {
      print('Error $e');
      return null;
    }
  }

  Future<bool> doesFileExist(fileName) async {
    print('checking if file exists...');
    final List<FileObject> objects =
        await supabase.storage.from('profileImages').list();
    for (var object in objects) {
      if (object.name == fileName) {
        return true;
      }
    }
    return false;
  }
}
