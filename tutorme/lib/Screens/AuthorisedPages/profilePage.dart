import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorme/Components/ByScreen/profilePageComponents/bio.dart';
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
              FutureBuilder<Map<String, dynamic>>(
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
                    } else if (!snapshot.hasData ||
                        !snapshot.data!['availableSession']) {
                      return Nonextsession();
                    } else {
                      final result = snapshot.data!;
                      print(result);
                      return Nextsession(
                          time: result['data']['Time'],
                          location: result['data']['Location']);
                    }
                  }),
              15.verticalSpace,
              Bio(),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> checkAvailableSession() async {
    print('checking with database...');
    final currentUID = supabase.auth.currentUser?.id;
    print(currentUID);

    final response = await supabase
        .from('bookings')
        .select()
        .eq('Tutor', '$currentUID')
        .isFilter('Student', null);

    final data = response as List;

    return {
      'availableSession': data.isNotEmpty,
      'data': data.isNotEmpty ? data[0] : null
    };
  }
}

class sessionCheckResult {
  final bool availableSession;
  final List<dynamic>? data;

  sessionCheckResult({required this.availableSession, required this.data});
}
