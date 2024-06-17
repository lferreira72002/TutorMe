import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnauthorisedButton extends StatelessWidget {
  final onPressed;
  final backGroundColour;
  final text;
  final textColour;
  final isBorder;

  const UnauthorisedButton(
      {super.key,
      required this.onPressed,
      required this.backGroundColour,
      required this.text,
      required this.textColour,
      this.isBorder = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: !isBorder
              ? BoxDecoration(
                  color: backGroundColour,
                  borderRadius: BorderRadius.circular(20))
              : BoxDecoration(
                  color: backGroundColour,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xffE1E1E1), width: 2)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColour,
                fontFamily: 'Montserrat',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
