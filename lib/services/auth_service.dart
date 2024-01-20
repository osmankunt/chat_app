import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Future<SharedPreferences> pref = SharedPreferences.getInstance();
}
