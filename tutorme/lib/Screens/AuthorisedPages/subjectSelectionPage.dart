import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubjectselectionPage extends StatefulWidget {
  const SubjectselectionPage({super.key});

  @override
  State<SubjectselectionPage> createState() => _SubjectselectionPageState();
}

class _SubjectselectionPageState extends State<SubjectselectionPage> {
  final List<String> subjects = ['English', 'Math', 'Literature'];
  final Map<String, bool> selectedSubjects = {
    'English': false,
    'Math': false,
    'Literature': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Color(0xff31704A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xffFFFCF1)),
          onPressed: () {
            updateSubjects();
            Get.back();
          },
        ),
        title: Text(
          'Subjects',
          style: TextStyle(
            color: Color(0xffFFFCF1),
            fontFamily: 'Montserrat',
            fontSize: 26.sp,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xff31704A),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffFFFCF1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(
                    child: Text(
                      'Select all the subjects below you feel comfortable teaching',
                      style: TextStyle(
                        color: Color(0xff31704A),
                        fontFamily: 'Montserrat',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      String subject = subjects[index];
                      return CheckboxListTile(
                        title: Text(
                          subject,
                          style: TextStyle(
                            color: Color(0xff31704A),
                            fontFamily: 'Montserrat',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        value: selectedSubjects[subject],
                        onChanged: (bool? value) {
                          setState(() {
                            selectedSubjects[subject] = value ?? false;
                          });
                        },
                        activeColor: Color(0xff31704A),
                        checkColor: Color(0xffFFFCF1),
                        controlAffinity: ListTileControlAffinity.leading,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Create connection to database and update selected subjects
  void updateSubjects() {}
}
