import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorme/Components/Buttons/unauthorisedButton.dart';
import 'package:get/get.dart';
import 'package:tutorme/Components/Inputs/unauthorisedInput.dart';
import 'package:tutorme/main.dart';

class signupBluecardPage extends StatefulWidget {
  const signupBluecardPage({super.key});

  @override
  State<signupBluecardPage> createState() => _signupBluecardPageState();
}

class _signupBluecardPageState extends State<signupBluecardPage> {
  final nameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

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
                                key: _formkey,
                                child: Column(children: [
                                  unauthorisedInput(
                                    hintText: "Jane Doe",
                                    label: "Full Name",
                                    controller: nameController,
                                    validator: nameVal,
                                  ),
                                  unauthorisedInput(
                                    hintText: "77777777/7",
                                    label: "Bluecard Number",
                                    controller: cardNumberController,
                                    formatters: [BluecardNumberFormatter()],
                                    keyboard: TextInputType.number,
                                    validator: cardNumberVal,
                                  ),
                                  unauthorisedInput(
                                    hintText: "YYYY/MM/DD",
                                    label: 'Expiry Date',
                                    controller: expiryController,
                                    formatters: [ExpiryDateFormatter()],
                                    textInputAction: TextInputAction.done,
                                    keyboard: TextInputType.numberWithOptions(
                                        signed: true),
                                    validator: expiryDateVal,
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

  void navigateToBank() async {
    //validate
    if (_formkey.currentState!.validate()) {
      print('Valid!');

      //Send data to database
      try {
        await supabase.from("bluecards").insert({
          'full_name': nameController.text,
          'bluecard_number': cardNumberController.text,
          'expiry_date': expiryController.text,
        });
      } catch (e) {
        print('Error $e');
      }
      //Go to next page
      Get.offAllNamed("/SignUpBank");
    }
    print('Navigate to Bank ');
  }

  String? nameVal(String? toVal) {
    RegExp regex = RegExp(r"^[A-Z][a-z]+ [A-Z][a-z]+");
    if (toVal == null || toVal.isEmpty) {
      return '';
    } else if (!regex.hasMatch(toVal)) {
      return '';
    }
  }

  String? cardNumberVal(String? toVal) {
    if (toVal == null || toVal.isEmpty || toVal.length < 8) {
      return '';
    }
    return null;
  }

  String? expiryDateVal(String? toVal) {
    if (toVal == null || toVal.isEmpty || toVal.length < 10) {
      return '';
    }
    return null;
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

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // If the new text is longer than the old text, we need to format it
    if (newText.length > oldValue.text.length) {
      // If the text exceeds the format length, revert to old value
      if (newText.length > 10) {
        return oldValue;
      }
      // Automatically add a slash after the 4th and 7th characters if not already there
      if (newText.length == 5 && newText[4] != '/') {
        newText = newText.substring(0, 4) + '/' + newText.substring(4);
      }
      if (newText.length == 8 && newText[7] != '/') {
        newText = newText.substring(0, 7) + '/' + newText.substring(7);
      }
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
