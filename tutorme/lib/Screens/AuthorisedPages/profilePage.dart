import 'package:flutter/material.dart';
import 'package:tutorme/Components/Misc/profileHeader.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffFFFCF1),
          child: Column(
            children: [Profileheader()],
          ),
        ),
      ),
    );
  }
}
