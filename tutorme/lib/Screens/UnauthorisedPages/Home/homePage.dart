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
    return Scaffold(
        appBar: AppBar(
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
            child: SafeArea(
                child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFFFCF1),
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          200.verticalSpaceFromWidth,
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
                          100.verticalSpaceFromWidth,
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
  }
}
