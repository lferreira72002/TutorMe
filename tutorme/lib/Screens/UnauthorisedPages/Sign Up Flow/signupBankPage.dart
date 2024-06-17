import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorme/Components/Buttons/unauthorisedButton.dart';
import 'package:get/get.dart';
import 'package:tutorme/Components/Inputs/unauthorisedInput.dart';

class signupBankPage extends StatefulWidget {
  const signupBankPage({super.key});

  @override
  State<signupBankPage> createState() => _signupBankPageState();
}

class _signupBankPageState extends State<signupBankPage> {
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
                                        'Bank Details',
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
                                        'We will need your bank details\nto pay you',
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
                                hint_text: "Account Name",
                                controller: nameController,
                              ),
                              unauthorisedInput(
                                  hint_text: "BSB Number",
                                  controller: emailController,
                                  formatters: [HyphenInputFormatter()],
                                  keyboard: TextInputType.numberWithOptions(
                                      signed: true)),
                              unauthorisedInput(
                                hint_text: "Account Number",
                                controller: passwordController,
                                textInputAction: TextInputAction.done,
                                keyboard: TextInputType.numberWithOptions(
                                    signed: true),
                                formatters: [
                                  LengthLimitingTextInputFormatter(10)
                                ],
                              ),
                            ])),
                            120.verticalSpaceFromWidth,
                            UnauthorisedButton(
                                onPressed: () {
                                  navigateToBluecard();
                                },
                                backGroundColour: Color(0xff437257),
                                text: "Finish",
                                textColour: Color(0xffFFFCF1)),
                          ],
                        ))))));
  }

  void navigateToBluecard() {
    print('Navigate to Account Update');
    Get.toNamed('/SignUpBluecard');
  }
}

class HyphenInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll('-', '');

    // Only allow digits to be entered
    if (newText.isNotEmpty &&
        !newText.characters.every((c) => c.contains(RegExp(r'[0-9]')))) {
      return oldValue;
    }

    // Limit to 6 digits maximum
    if (newText.length > 6) {
      newText = newText.substring(0, 6);
    }

    // Insert hyphen after the third digit
    if (newText.length > 3) {
      newText = newText.substring(0, 3) + '-' + newText.substring(3);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
