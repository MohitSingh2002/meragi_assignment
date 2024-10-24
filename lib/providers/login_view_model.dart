import 'package:flutter/material.dart';
import 'package:meragi_assignment/screens/home_page.dart';
import 'package:meragi_assignment/utils/shared_prefs.dart';

class LoginViewModel extends ChangeNotifier {

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isLoading = false;

  String email = '';
  String password = '';

  updatePasswordVisibility() {
    this.isPasswordVisible = !this.isPasswordVisible;
    notifyListeners();
  }

  void login({required BuildContext context}) {
    SharedPrefs().saveLoginData(email: emailController.text, password: passwordController.text);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  void getLoginData() async {
    this.isLoading = true;
    List<String> loginData = await SharedPrefs().getLoginData();
    email = loginData.elementAt(0);
    password = loginData.elementAt(1);
    this.isLoading = false;
    notifyListeners();
  }

}
