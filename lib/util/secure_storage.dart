import 'package:shared_preferences/shared_preferences.dart';

class SecureStorage {
  late SharedPreferences prefs;

  Storage() async {
    await SharedPreferences.getInstance();
  }
}
