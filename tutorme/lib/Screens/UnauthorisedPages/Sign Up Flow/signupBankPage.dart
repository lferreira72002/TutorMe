import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorme/Components/Buttons/unauthorisedButton.dart';
import 'package:get/get.dart';
import 'package:tutorme/Components/Inputs/unauthorisedInput.dart';
import 'package:tutorme/main.dart';

class signupBankPage extends StatefulWidget {
  const signupBankPage({super.key});

  @override
  State<signupBankPage> createState() => _signupBankPageState();
}

class _signupBankPageState extends State<signupBankPage> {
  final accountNameController = TextEditingController();
  final accountNumberController = TextEditingController();
  final accountBsbController = TextEditingController();
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
                                key: _formkey,
                                child: Column(children: [
                                  unauthorisedInput(
                                    hintText: "Everyday basics",
                                    label: "Account name",
                                    controller: accountNameController,
                                    validator: accountNameVal,
                                  ),
                                  unauthorisedInput(
                                      label: "BSB Number",
                                      hintText: "123-456",
                                      controller: accountBsbController,
                                      validator: bsbVal,
                                      formatters: [HyphenInputFormatter()],
                                      keyboard: TextInputType.numberWithOptions(
                                          signed: true)),
                                  unauthorisedInput(
                                    label: "Account Number",
                                    hintText: "123456789",
                                    controller: accountNumberController,
                                    validator: accountNumberVal,
                                    textInputAction: TextInputAction.done,
                                    keyboard: TextInputType.numberWithOptions(
                                        signed: true),
                                    formatters: [
                                      LengthLimitingTextInputFormatter(10)
                                    ],
                                  ),
                                ])),
                            150.verticalSpace,
                            UnauthorisedButton(
                                onPressed: () {
                                  navigateToConfirmation();
                                },
                                backGroundColour: Color(0xff437257),
                                text: "Finish",
                                textColour: Color(0xffFFFCF1)),
                          ],
                        ))))));
  }

  void navigateToConfirmation() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: Color(0xffFFFCF1),
            ),
          );
        });

    if (_formkey.currentState!.validate()) {
      print('Valid!');
      try {
        await supabase.from("tutorBankDetails").insert({
          "account_name": accountNameController.text,
          "account_number": accountNumberController.text,
          "bsb": accountBsbController.text,
        });
      } catch (e) {
        print("Error $e");
      }

      Get.offAllNamed("/SignUpConfirmation");
    } else {
      Navigator.of(context).pop();
      return;
    }

    print('Navigate to Account Update');
    Get.offAllNamed('/SignUpConfirmation');
  }

  String? accountNameVal(String? toVal) {
    if (toVal == null || toVal.isEmpty || toVal.length < 3) {
      return '';
    }
    return null;
  }

  String? bsbVal(String? toVal) {
    if (toVal == null || toVal.isEmpty || toVal.length < 7) {
      return '';
    }
    return null;
  }

  String? accountNumberVal(String? toVal) {
    if (toVal == null || toVal.isEmpty || toVal.length < 10) {
      return '';
    }
    return null;
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
