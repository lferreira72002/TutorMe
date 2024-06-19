import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tutorme/Components/Buttons/unauthorisedButton.dart';
import 'package:get/get.dart';
import 'package:tutorme/Components/Inputs/unauthorisedInput.dart';
import 'package:tutorme/main.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool signInError = false;

  //form key
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
                                key: _formkey,
                                child: Column(children: [
                                  unauthorisedInput(
                                    label: "Email",
                                    hintText: "",
                                    controller: emailController,
                                    isAutoFocus: true,
                                    validator: emailVal,
                                    errorText: signInError
                                        ? 'Invalid email or password'
                                        : null,
                                  ),
                                  unauthorisedInput(
                                    label: "Password",
                                    hintText: "",
                                    controller: passwordController,
                                    textInputAction: TextInputAction.done,
                                    isObscure: true,
                                    validator: passwordVal,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              naviagteToResetPasswordRequest();
                                            },
                                            child: Text("Forgot Password?",
                                                style: TextStyle(
                                                  color: Color(0xffC1C1C1),
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  decoration:
                                                      TextDecoration.none,
                                                )),
                                          )
                                        ]),
                                  ),
                                ])),
                            100.verticalSpaceFromWidth,
                            UnauthorisedButton(
                                onPressed: () {
                                  ValidateAndLogIn();
                                },
                                backGroundColour: Color(0xff437257),
                                text: "Login",
                                textColour: Color(0xffFFFCF1)),
                          ],
                        ))))));
  }

  void naviagteToResetPasswordRequest() {
    Get.toNamed('/ResetPasswordRequest');
  }

  void ValidateAndLogIn() async {
    setState(() {
      signInError = false;
    });

    if (_formkey.currentState!.validate()) {
      print('Validation passed...logging in! Please wait...');

      try {
        final AuthResponse res = await supabase.auth.signInWithPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } catch (e) {
        print('Error: $e');
        setState(() {
          signInError = true;
        });
      }

      final authSubscription = supabase.auth.onAuthStateChange.listen((data) {
        final AuthChangeEvent event = data.event;
        if (event == AuthChangeEvent.signedIn) {
          print('User is signed in');
        }
      });
    }
    //validate input field
  }

  String? emailVal(String? toVal) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (toVal == null || toVal.isEmpty) {
      return '';
    } else if (!regex.hasMatch(toVal)) {
      return '';
    } else if (signInError) return '';
  }

  String? passwordVal(String? toVal) {
    if (toVal == null || toVal.isEmpty) {
      return '';
    } else if (signInError) return '';
    return null;
  }
}
