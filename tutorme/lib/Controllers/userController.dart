import 'package:get/get.dart';

class UserController extends GetxController {
  var userName = ''.obs;
  var profileURL = ''.obs;

  void setUserName(String name) {
    userName.value = name;
  }

  void setProfileURL(String url) {
    profileURL.value = url;
  }
}
