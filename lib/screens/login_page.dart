import 'package:flutter/material.dart';
import 'package:meragi_assignment/providers/login_view_model.dart';
import 'package:meragi_assignment/screens/desktop/desktop_page.dart';
import 'package:meragi_assignment/screens/mobile/login_page_mobile.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            // Desktop view
            return DesktopPage();
          } else {
            // Mobile view
            return LoginPageMobile();
          }
        },
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: viewModel.emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: viewModel.passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 16.0),
          Align(
            alignment: Alignment.centerRight,
            child: Text('Forgot password?'),
          ),
          SizedBox(height: 32.0),
          viewModel.isLoading
              ? CircularProgressIndicator()
              : ElevatedButton(
            onPressed: () => viewModel.login(context: context),
            child: Text('Login'),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Or, login with '),
              TextButton(
                onPressed: () {},
                child: Text('Facebook'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('LinkedIn'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Google'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
