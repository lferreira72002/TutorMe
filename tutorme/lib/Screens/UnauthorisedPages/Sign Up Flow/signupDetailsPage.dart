import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tutorme/Components/Buttons/unauthorisedButton.dart';
import 'package:get/get.dart';
import 'package:tutorme/Components/Inputs/unauthorisedInput.dart';
import 'package:tutorme/main.dart';

class signupDetailsPage extends StatefulWidget {
  const signupDetailsPage({super.key});

  @override
  State<signupDetailsPage> createState() => _signupDetailsPageState();
}

class _signupDetailsPageState extends State<signupDetailsPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool createUserError = false;
  int? isTutor = 0;
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
                                key: _formkey,
                                child: Column(children: [
                                  unauthorisedInput(
                                    label: "Name",
                                    hintText: "",
                                    controller: nameController,
                                    validator: nameVal,
                                  ),
                                  unauthorisedInput(
                                    label: "Email",
                                    hintText: "",
                                    controller: emailController,
                                    validator: emailVal,
                                  ),
                                  unauthorisedInput(
                                    label: "Password",
                                    hintText: "",
                                    controller: passwordController,
                                    textInputAction: TextInputAction.done,
                                    isObscure: true,
                                    validator: passwordVal,
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
                                  validateAndContinue();
                                },
                                backGroundColour: Color(0xff437257),
                                text: "Continue",
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
    } else if (createUserError) return '';
  }

  String? passwordVal(String? toVal) {
    if (toVal == null || toVal.isEmpty || toVal.length < 6) {
      return '';
    } else if (createUserError) return '';
    return null;
  }

  String? nameVal(String? toVal) {
    if (toVal == null || toVal.isEmpty) {
      return '';
    } else if (createUserError) return '';
    return null;
  }

  void validateAndContinue() async {
    final bool tutor = (isTutor == 1);

    if (_formkey.currentState!.validate()) {
      try {
        final AuthResponse res = await supabase.auth.signUp(
            email: emailController.text,
            password: passwordController.text,
            data: {
              "is_tutor": tutor,
              'email': emailController.text,
              'first_name': nameController.text,
            });
      } catch (e) {
        print('Error: $e');
        setState(() {
          createUserError = true;
        });
      }

      final authSubscription = supabase.auth.onAuthStateChange.listen((data) {
        final AuthChangeEvent event = data.event;
        if (event == AuthChangeEvent.signedIn) {
          print('User is signed in');
        }
      });

      if (isTutor == 1) {
        Get.offAllNamed('/SignUpBluecard');
      } else {
        // SEND TO HOME
        print("Send to Home");
      }
      ;
    }
  }
}
