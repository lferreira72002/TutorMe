import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorme/UnAuthPages/Home/homePage.dart';
import 'package:flutter/services.dart';

void main() async {
  await Supabase.initialize(
      url: "https://qsltbdfjfxhjburxnnqd.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFzbHRiZGZqZnhoamJ1cnhubnFkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI5MzAzOTYsImV4cCI6MjAyODUwNjM5Nn0.4NpTtopdBEOGjjJyzcZENXUZ3GHOLEYCt_noCle0b2o");
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
          ],
        );
      },
    );
  }
}
