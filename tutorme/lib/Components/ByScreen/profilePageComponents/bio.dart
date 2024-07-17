import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tutorme/Components/ByScreen/bioComponents/bioEditor.dart';
import 'package:tutorme/Controllers/userController.dart';

class Bio extends StatefulWidget {
  const Bio({super.key});

  @override
  State<Bio> createState() => _BioState();
}

class _BioState extends State<Bio> {
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffFFFCF1),
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          Obx(
                            () => Container(
                              child: CircleAvatar(
                                backgroundColor: Color(0xffFFFCF1),
                                backgroundImage:
                                    userController.profileURL.isNotEmpty
                                        ? NetworkImage(
                                            userController.profileURL.value)
                                        : null,
                                child: userController.profileURL.isEmpty
                                    ? Icon(Icons.cloud_upload_outlined)
                                    : null, // Replace with your avatar image URL
                                radius: 26.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Column(
                              children: [
                                Text(
                                  userController.userName.value,
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontFamily: 'Montserrat',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.verticalSpace,
                            Text(
                              "About Me",
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontFamily: 'Montserrat',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            bioEditoer(
                              label: "Tell your clients about yourself",
                            ),
                            10.verticalSpace,
                            Text(
                              "Subjects Offered",
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontFamily: 'Montserrat',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text('English, Math')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
