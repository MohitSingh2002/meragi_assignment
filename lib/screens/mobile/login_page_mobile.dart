import 'package:flutter/material.dart';
import 'package:meragi_assignment/providers/login_view_model.dart';
import 'package:meragi_assignment/screens/desktop/views/social_button.dart';
import 'package:meragi_assignment/utils/app_colors.dart';
import 'package:meragi_assignment/utils/app_font_family.dart';
import 'package:provider/provider.dart';

class LoginPageMobile extends StatefulWidget {

  @override
  State<LoginPageMobile> createState() => _LoginPageMobileState();
}

class _LoginPageMobileState extends State<LoginPageMobile> {

  void _togglePasswordVisibility() {
    Provider.of<LoginViewModel>(context, listen: false).updatePasswordVisibility();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: GradientClipper(),
              child: Container(
                padding: EdgeInsets.only(top: 40, bottom: 100,),
                decoration: BoxDecoration(
                  gradient: AppColors.gradient,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/design.png',
                      height: 50,
                      color: AppColors.white,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      'Design Guild',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                        fontFamily: AppFontFamily.fontInter,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Join our\ncommunity today',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkBrown,
                      fontFamily: AppFontFamily.fontInter,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    'Get connected, find designers to start a project',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors.darkBrown,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: AppColors.gradient,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                          fontFamily: AppFontFamily.fontInter,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Or, login with',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkPurple,
                        fontFamily: AppFontFamily.fontInter,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(child: SocialButton(platform: 'Facebook')),
                        SizedBox(width: 15,),
                        Expanded(child: SocialButton(platform: 'Linked In')),
                        SizedBox(width: 15,),
                        Expanded(child: SocialButton(platform: 'Google')),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: viewModel.emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: AppColors.darkBrown,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.lightBrown,
                                )
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 24,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: viewModel.passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: AppColors.darkBrown,
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lightBrown,
                                    )
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    viewModel.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                  ),
                                  color: AppColors.lightBrown,
                                  onPressed: _togglePasswordVisibility,
                                ),
                              ),
                              obscureText: !viewModel.isPasswordVisible,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 12,),
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.darkBrown,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 24,),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: AppColors.gradient,
                              borderRadius: BorderRadius.all(Radius.circular(8))
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (viewModel.formKey.currentState!.validate()) {
                                Provider.of<LoginViewModel>(context, listen: false).login(context: context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.white,
                                fontFamily: AppFontFamily.fontInter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GradientClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, size.height * 0.6, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
