import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorme/Components/Buttons/unauthorisedButton.dart';
import 'package:get/get.dart';
import 'package:tutorme/Components/Inputs/unauthorisedInput.dart';

class signupDetailsPage extends StatefulWidget {
  const signupDetailsPage({super.key});

  @override
  State<signupDetailsPage> createState() => _signupDetailsPageState();
}

class _signupDetailsPageState extends State<signupDetailsPage> {
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Color(0xff437257)),
            onPressed: () {
              Get.back();
            },
          ),
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
                                        'Welcome',
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
                                        'We need some basic info.',
                                        style: TextStyle(
                                          color: Color(0xff437257),
                                          fontFamily: 'Montserrat',
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            20.verticalSpaceFromWidth,
                            Form(
                                child: Column(children: [
                              unauthorisedInput(
                                hint_text: "Name",
                                controller: nameController,
                              ),
                              unauthorisedInput(
                                hint_text: "Email",
                                controller: emailController,
                              ),
                              unauthorisedInput(
                                hint_text: "Password",
                                controller: passwordController,
                                textInputAction: TextInputAction.done,
                                isObsecure: true,
                              ),
                            ])),
                            80.verticalSpaceFromWidth,
                            UnauthorisedButton(
                                onPressed: () {
                                  navigateToHome();
                                },
                                backGroundColour: Color(0xff53B87B),
                                text: "I am a parent/student",
                                textColour: Color(0xffFFFCF1)),
                            10.verticalSpaceFromWidth,
                            UnauthorisedButton(
                                onPressed: () {
                                  navigateToBluecard();
                                },
                                backGroundColour: Color(0xff437257),
                                text: "I am a tutor",
                                textColour: Color(0xffFFFCF1)),
                          ],
                        ))))));
  }

  void navigateToHome() {
    print('Navigate to Home');
  }

  void navigateToBluecard() {
    print('Navigate to Bluecard');
    Get.toNamed('/SignUpBluecard');
  }
}
