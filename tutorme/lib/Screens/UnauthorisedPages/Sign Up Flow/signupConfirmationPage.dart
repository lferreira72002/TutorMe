import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorme/Components/Buttons/unauthorisedButton.dart';
import 'package:get/get.dart';
import 'package:tutorme/Components/Misc/bulletPoint.dart';

class singupConfirmationPage extends StatefulWidget {
  const singupConfirmationPage({super.key});

  @override
  State<singupConfirmationPage> createState() => _singupConfirmationPageState();
}

class _singupConfirmationPageState extends State<singupConfirmationPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Color(0xffFFFCF1),
        ),
        body: Container(
            height: screenHeight,
            color: Color(0xffFFFCF1),
            child: SingleChildScrollView(
                child: SafeArea(
                    child: Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('TutorMe',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: Color(0xff437257),
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700))
                                  ]),
                            ),
                            80.verticalSpaceFromWidth,
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'We are on it!',
                                        style: TextStyle(
                                          color: Color(0xff437257),
                                          fontFamily: 'Montserrat',
                                          fontSize: 32.sp,
                                          fontWeight: FontWeight.w700,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'We need a little time to run some checks.\nYou’ll hear from us within 48 hours. Why\nnot explore your profile, there is lots to\ndo:',
                                        style: TextStyle(
                                          color: Color(0xff437257),
                                          fontFamily: 'Montserrat',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.verticalSpace,
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Column(
                                      children: [
                                        BulletList([
                                          "Schedule your availability",
                                          "Set an hourly rate",
                                          "Upload a profile picture",
                                          "Write a bio"
                                        ])
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            150.verticalSpace,
                            UnauthorisedButton(
                                onPressed: () {
                                  navigateToProfile();
                                },
                                backGroundColour: Color(0xff437257),
                                text: "To profile",
                                textColour: Color(0xffFFFCF1)),
                          ],
                        ))))));
  }

  void navigateToProfile() {
    print('Navigate to Profile');
    Get.offAllNamed('/OwnProfile');
  }
}
