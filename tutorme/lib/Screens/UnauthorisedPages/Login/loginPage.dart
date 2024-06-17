import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorme/Components/Buttons/unauthorisedButton.dart';
import 'package:get/get.dart';
import 'package:tutorme/Components/Inputs/unauthorisedInput.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
              Get.toNamed('/');
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
                            100.verticalSpaceFromWidth,
                            Text(
                              'Log In',
                              style: TextStyle(
                                color: Color(0xff437257),
                                fontFamily: 'Montserrat',
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            100.verticalSpaceFromWidth,
                            Form(
                                child: Column(children: [
                              unauthorisedInput(
                                hint_text: "Email",
                                controller: emailController,
                                isAutoFocus: true,
                              ),
                              unauthorisedInput(
                                hint_text: "Password",
                                controller: passwordController,
                                textInputAction: TextInputAction.done,
                                isObsecure: true,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        child: Text("Forgot Password?",
                                            style: TextStyle(
                                              color: Color(0xffC1C1C1),
                                              fontFamily: 'Montserrat',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              decoration: TextDecoration.none,
                                            )),
                                      )
                                    ]),
                              ),
                            ])),
                            100.verticalSpaceFromWidth,
                            UnauthorisedButton(
                                onPressed: () {
                                  navigateToLogin();
                                },
                                backGroundColour: Color(0xff437257),
                                text: "Login",
                                textColour: Color(0xffFFFCF1)),
                          ],
                        ))))));
  }

  void navigateToLogin() {
    print('Navigate to login page');
  }

  void navigateToGetStarted() {
    print('Navigate to get started page');
  }
}
