import 'package:meragi_assignment/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {

  void saveLoginData({required String email, required String password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.EMAIL, email);
    prefs.setString(Constants.PASSWORD, password);
  }

  Future<List<String>> getLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString(Constants.EMAIL) ?? '';
    String password = prefs.getString(Constants.PASSWORD) ?? '';
    return [email, password];
  }

}
