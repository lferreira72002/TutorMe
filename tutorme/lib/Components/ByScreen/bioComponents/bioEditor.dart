import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorme/main.dart';

class bioEditoer extends StatelessWidget {
  final String label;
  final biographyController = TextEditingController();

  bioEditoer({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: biographyController,
        style: TextStyle(
          color: Color(0xff000000),
          fontFamily: 'Montserrat',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        decoration: new InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            label: Text(
              label,
              style: TextStyle(
                color: Color(0xff000000),
                fontFamily: 'Montserrat',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
        onEditingComplete: () => saveBioToDatabase(),
      ),
    );
  }

  saveBioToDatabase() async {
    try {
      await supabase.from("tutors").upsert({
        'id': supabase.auth.currentUser?.id,
        'biography': biographyController.text,
      }, defaultToNull: true, onConflict: 'id');
    } catch (e) {
      print('Error $e');
    }
  }
}
