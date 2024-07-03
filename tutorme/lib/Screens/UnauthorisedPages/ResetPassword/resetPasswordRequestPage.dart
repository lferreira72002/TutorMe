import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tutorme/Components/Buttons/unauthorisedButton.dart';
import 'package:get/get.dart';
import 'package:tutorme/Components/Inputs/unauthorisedInput.dart';
import 'package:tutorme/main.dart';

class resetPasswordRequestPage extends StatefulWidget {
  const resetPasswordRequestPage({super.key});

  @override
  State<resetPasswordRequestPage> createState() =>
      _resetPasswordRequestPageState();
}

class _resetPasswordRequestPageState extends State<resetPasswordRequestPage> {
  final emailController = TextEditingController();
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
                                        'Reset Password',
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
                                        'Don’t worry! We’ll email you\ninstructions to reset your password',
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
                                ],
                              ),
                            ),
                            20.verticalSpaceFromWidth,
                            Form(
                                key: _formkey,
                                child: Column(children: [
                                  unauthorisedInput(
                                    label: "Email",
                                    hintText: "",
                                    controller: emailController,
                                    validator: emailVal,
                                  ),
                                ])),
                            200.verticalSpace,
                            UnauthorisedButton(
                                onPressed: () {
                                  changePassword();
                                },
                                backGroundColour: Color(0xff437257),
                                text: "Send Email",
                                textColour: Color(0xffFFFCF1)),
                          ],
                        ))))));
  }

  String? emailVal(String? toVal) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (toVal == null || toVal.isEmpty) {
      return '';
    } else if (!regex.hasMatch(toVal)) {
      return '';
    }
  }

  void changePassword() async {
    await supabase.auth.resetPasswordForEmail(emailController.text,
        redirectTo: "io.supabase.tutorme://resetPasswordRequestPage");
    print("email sent!");

    final authSubscription = supabase.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      if (event == AuthChangeEvent.passwordRecovery) {
        Get.offAllNamed('/ResetPasswordActionPage');
      }
    });
  }
}
