import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubjectselectionPage extends StatefulWidget {
  const SubjectselectionPage({super.key});

  @override
  State<SubjectselectionPage> createState() => _SubjectselectionPageState();
}

class _SubjectselectionPageState extends State<SubjectselectionPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Color(0xff31704A),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Color(0xffFFFCF1)),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Container(
          color: Color(0xff31704A),
          height: screenHeight,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      'Subjects',
                      style: TextStyle(
                        color: Color(0xffFFFCF1),
                        fontFamily: 'Montserrat',
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Color(0xffFFFCF1),
                      borderRadius: BorderRadius.only(topLeft: )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
