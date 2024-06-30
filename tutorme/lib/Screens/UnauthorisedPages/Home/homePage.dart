import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorme/Components/Buttons/unauthorisedButton.dart';
import 'package:get/get.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffFFFCF1),
        ),
        body: Container(
            height: screenHeight,
            decoration: BoxDecoration(
              color: Color(0xffFFFCF1),
            ),
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Container(
              child: Column(
                children: [
                  150.verticalSpace,
                  Image.asset('assets/images/GreenHatLogo.png',
                      height: 100, width: 100),
                  Text(
                    'TutorMe',
                    style: TextStyle(
                      color: Color(0xff437257),
                      fontFamily: 'Montserrat',
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  150.verticalSpace,
                  UnauthorisedButton(
                      onPressed: () {
                        navigateToLogin();
                      },
                      backGroundColour: Color(0xff437257),
                      text: "Login",
                      textColour: Color(0xffFFFCF1)),
                  UnauthorisedButton(
                    onPressed: () {
                      navigateToGetStarted();
                    },
                    backGroundColour: Color(0xffFFFCF1),
                    text: "Get Started",
                    textColour: Color(0xff437257),
                    isBorder: true,
                  )
                ],
              ),
            )))));
  }

  void navigateToLogin() {
    print('Navigate to login page');
    Get.toNamed('/Login');
  }

  void navigateToGetStarted() {
    print('Navigate to get started page');
    Get.toNamed('/SignUpDetails');
  }
}
