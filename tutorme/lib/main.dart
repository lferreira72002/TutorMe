import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorme/Controllers/userController.dart';
import 'package:tutorme/Screens/AuthorisedPages/profilePage.dart';
import 'package:tutorme/Screens/AuthorisedPages/subjectSelectionPage.dart';
import 'package:tutorme/Screens/UnauthorisedPages/Home/homePage.dart';
import 'package:flutter/services.dart';
import 'package:tutorme/Screens/UnauthorisedPages/Login/loginPage.dart';
import 'package:tutorme/Screens/UnauthorisedPages/ResetPassword/resetPasswordActionPage.dart';
import 'package:tutorme/Screens/UnauthorisedPages/ResetPassword/resetPasswordRequestPage.dart';
import 'package:tutorme/Screens/UnauthorisedPages/Sign%20Up%20Flow/signupBankPage.dart';
import 'package:tutorme/Screens/UnauthorisedPages/Sign%20Up%20Flow/signupConfirmationPage.dart';
import 'package:tutorme/Screens/UnauthorisedPages/Sign%20Up%20Flow/signupDetailsPage.dart';
import 'package:tutorme/Screens/UnauthorisedPages/Sign%20Up%20Flow/signupBluecardPage.dart';

void main() async {
  await Supabase.initialize(
      url: "https://qsltbdfjfxhjburxnnqd.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFzbHRiZGZqZnhoamJ1cnhubnFkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI5MzAzOTYsImV4cCI6MjAyODUwNjM5Nn0.4NpTtopdBEOGjjJyzcZENXUZ3GHOLEYCt_noCle0b2o");
  Get.put(UserController());
  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: Size(393, 852),
      builder: (BuildContext context, Widget? child) {
        // Ensure to include BuildContext and Widget? as parameters
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TutorMe',
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => homePage()),
            GetPage(name: '/Login', page: () => loginPage()),
            GetPage(name: '/SignUpDetails', page: () => signupDetailsPage()),
            GetPage(name: '/SignUpBluecard', page: () => signupBluecardPage()),
            GetPage(name: '/SignUpBank', page: () => signupBankPage()),
            GetPage(
                name: '/SignUpConfirmation',
                page: () => singupConfirmationPage()),
            GetPage(
                name: '/ResetPasswordRequest',
                page: () => resetPasswordRequestPage()),
            GetPage(
                name: '/ResetPasswordRequest',
                page: () => resetPasswordActionPage()),
            GetPage(name: '/OwnProfile', page: () => profilePage()),
            GetPage(
                name: '/subjectSelection', page: () => SubjectselectionPage())
          ],
        );
      },
    );
  }
}
