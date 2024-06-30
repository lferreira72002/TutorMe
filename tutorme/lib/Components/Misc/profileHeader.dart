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
                            backgroundImage: NetworkImage(
                                'https://qsltbdfjfxhjburxnnqd.supabase.co/storage/v1/object/public/profileImages/${supabase.auth.currentUser!.id}_profilepicture.jpg'), // Replace with your avatar image URL
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
      final fileName =
          '${supabase.auth.currentUser!.id}_profilepicture.$fileExt';
      final filePath = fileName;
      await supabase.storage.from('profileImages').uploadBinary(
            filePath,
            bytes,
            fileOptions: FileOptions(contentType: imageFile.mimeType),
          );

      final imageUrlResponse = await supabase.storage
          .from('avatars')
          .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);
      userController.setProfileURL(imageUrlResponse);
    } catch (e) {
      print('Error $e');
      return null;
    }
  }
}
