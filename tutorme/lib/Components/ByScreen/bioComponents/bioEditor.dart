import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorme/main.dart';

class bioEditoer extends StatefulWidget {
  final String label;

  bioEditoer({super.key, required this.label});

  @override
  State<bioEditoer> createState() => _bioEditoerState();
}

class _bioEditoerState extends State<bioEditoer> {
  final biographyController = TextEditingController();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    checkAndFetchBio();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: SingleChildScrollView(
          child: TextField(
            textInputAction: TextInputAction.done,
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
                  widget.label,
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontFamily: 'Montserrat',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none),
            maxLines: null,
            keyboardType: TextInputType.multiline,
            onEditingComplete: () {
              saveBioToDatabase();
              FocusScope.of(context).unfocus();
            },
          ),
        ),
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

  void checkAndFetchBio() async {
    final currentUID = supabase.auth.currentUser?.id;

    try {
      final response = await supabase
          .from("tutors")
          .select("biography")
          .eq('id', '$currentUID');

      final data = response as List;
      print(data[0]['biography']);

      if (response.isNotEmpty) {
        biographyController.text = data[0]['biography'].toString();
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
