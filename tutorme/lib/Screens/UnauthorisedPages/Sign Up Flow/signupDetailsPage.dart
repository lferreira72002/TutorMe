import 'package:flutter/cupertino.dart';
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
  int? isTutor = 0;

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
                            10.verticalSpace,
                            CupertinoSlidingSegmentedControl(
                                padding: EdgeInsets.all(10),
                                children: {
                                  0: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35, vertical: 10),
                                    child: Text(
                                      'Student',
                                      style: TextStyle(
                                        color: isTutor == 0
                                            ? Color(0xffF6F5EE)
                                            : Color(0xff437257),
                                        fontFamily: 'Montserrat',
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                  1: Text(
                                    'Tutor',
                                    style: TextStyle(
                                      color: isTutor != 0
                                          ? Color(0xffF6F5EE)
                                          : Color(0xff437257),
                                      fontFamily: 'Montserrat',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                },
                                backgroundColor: Color(0xffF6F5EE),
                                thumbColor: Color(0xff437257),
                                groupValue: isTutor,
                                onValueChanged: (int? newValue) {
                                  setState(() {
                                    isTutor = newValue;
                                    print(isTutor);
                                  });
                                }),
                            70.verticalSpace,
                            UnauthorisedButton(
                                onPressed: () {
                                  navigateToNextScreen();
                                },
                                backGroundColour: Color(0xff437257),
                                text: "Continue",
                                textColour: Color(0xffFFFCF1)),
                          ],
                        ))))));
  }

  void navigateToNextScreen() {
    print('Navigate to next screen');
    if (isTutor == 1) {
      Get.offAllNamed('/SignUpBluecard');
    } else {
      Get.toNamed('/Login');
    }
  }
}
