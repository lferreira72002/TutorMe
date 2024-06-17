import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorme/Components/Buttons/unauthorisedButton.dart';
import 'package:get/get.dart';
import 'package:tutorme/Components/Inputs/unauthorisedInput.dart';

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
                                        'We need a little time to run some\nchecks. You’ll hear from us within\n48 hours. In the mean time, why not\nexplore your profile. There is lots to\ndo:',
                                        style: TextStyle(
                                          color: Color(0xff437257),
                                          fontFamily: 'Montserrat',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [],
                                  )
                                ],
                              ),
                            ),
                            250.verticalSpace,
                            UnauthorisedButton(
                                onPressed: () {
                                  navigateToBluecard();
                                },
                                backGroundColour: Color(0xff437257),
                                text: "To profile",
                                textColour: Color(0xffFFFCF1)),
                          ],
                        ))))));
  }

  void navigateToHome() {
    print('Navigate to Home');
  }

  void navigateToBluecard() {
    print('Navigate to Bluecard');
    Get.offAllNamed('/SignUpBluecard');
  }
}
