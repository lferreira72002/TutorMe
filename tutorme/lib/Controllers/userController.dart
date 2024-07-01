import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tutorme/main.dart';

class UserController extends GetxController {
  var userName = ''.obs;
  var profileURL = ''.obs;

  void setUserName(String name) {
    userName.value = name;
  }

  void setProfileURL(String url) {
    profileURL.value = url;
  }

  bool hasProfileURL() {
    return profileURL.isNotEmpty;
  }

  Future<void> updateProfileURL(String url) async {
    profileURL.value = url;

    final UserResponse res = await supabase.auth
        .updateUser(UserAttributes(data: {'profile_url': url}));

    print(supabase.auth.currentUser?.userMetadata);
  }
}
