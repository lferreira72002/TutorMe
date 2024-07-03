import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorme/Components/ByScreen/profilePageComponents/nextSession.dart';
import 'package:tutorme/Components/ByScreen/profilePageComponents/noNextSession.dart';
import 'package:tutorme/Components/ByScreen/profilePageComponents/profileHeader.dart';
import 'package:tutorme/Components/ByScreen/profilePageComponents/searchBar.dart';
import 'package:tutorme/main.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xff31704A),
          child: Column(
            children: [
              Profileheader(),
              0.verticalSpace,
              FutureBuilder<bool>(
                  future: checkAvailableSession(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    } else {
                      final hasSessions = snapshot.data ?? false;
                      return hasSessions ? Nextsession() : noNextsession();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> checkAvailableSession() async {

    final currentUID = supabase.auth.currentUser?.id;

    final data = await supabase.from('bookings').select().eq('UID', currentUID)
  }
}
