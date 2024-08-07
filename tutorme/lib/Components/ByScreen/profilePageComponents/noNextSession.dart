import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Nonextsession extends StatefulWidget {
  const Nonextsession({super.key});

  @override
  State<Nonextsession> createState() => _NonextsessionState();
}

class _NonextsessionState extends State<Nonextsession> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
            child: Text(
              'Next Available Session',
              style: TextStyle(
                color: Color(0xffFFFCF1),
                fontFamily: 'Montserrat',
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffB54242),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffFFFCF1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    "No Session Available",
                                    style: TextStyle(
                                      color: Color(0xff000000),
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              indent: 30,
                              endIndent: 80,
                              color: Color(0xffD9D7CE),
                              thickness: 1.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    "Check back later for more open sessions",
                                    style: TextStyle(
                                      color: Color(0xffA5A5A4),
                                      fontFamily: 'Montserrat',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  right: 10.0,
                  top: 30.0,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xffD9D7CE),
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
