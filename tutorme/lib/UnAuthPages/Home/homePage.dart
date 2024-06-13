import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
            child: SafeArea(
                child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFFFCF1),
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          200.verticalSpaceFromWidth,
                          Image.asset('assets/images/GreenHatLogo.png',
                              height: 100, width: 100),
                          Text(
                            'TutorMe',
                            style: TextStyle(
                                color: Color(0xff437257),
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    )))));
  }
}
