import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorme/Components/Buttons/unauthorisedButton.dart';
import 'package:get/get.dart';
import 'package:tutorme/Components/Inputs/unauthorisedInput.dart';

class signupBluecardPage extends StatefulWidget {
  const signupBluecardPage({super.key});

  @override
  State<signupBluecardPage> createState() => _signupBluecardPageState();
}

class _signupBluecardPageState extends State<signupBluecardPage> {
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
                                        'Bluecard Check',
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
                                        'In Queensland, all child related\noccupations need a Bluecard',
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
                                hintText: "Full name as per Bluecard",
                                controller: nameController,
                              ),
                              unauthorisedInput(
                                  hintText: "Bluecard Number",
                                  controller: emailController,
                                  formatters: [BluecardNumberFormatter()],
                                  keyboard: TextInputType.number),
                              unauthorisedInput(
                                hintText: "Bluecard Expiry Date",
                                controller: passwordController,
                                textInputAction: TextInputAction.done,
                                keyboard: TextInputType.numberWithOptions(
                                    signed: true),
                              ),
                            ])),
                            100.verticalSpace,
                            UnauthorisedButton(
                                onPressed: () {
                                  navigateToBank();
                                },
                                backGroundColour: Color(0xff437257),
                                text: "Validate",
                                textColour: Color(0xffFFFCF1)),
                          ],
                        ))))));
  }

  void navigateToBank() {
    print('Navigate to Bank ');
    Get.offAllNamed('/SignUpBank');
  }
}

class BluecardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Check if the new text is longer and what the last character is
    if (newText.length > oldValue.text.length) {
      // If text exceeds the format, revert to old value
      if (newText.length > 10 ||
          (newText.length == 9 &&
              newText[8] != '/' &&
              newText.length > oldValue.text.length)) {
        return oldValue;
      }
      // Automatically add a slash after 8 digits if it's not already there
      if (newText.length == 8 && oldValue.text.length == 7) {
        newText += '/';
      }
    }
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
