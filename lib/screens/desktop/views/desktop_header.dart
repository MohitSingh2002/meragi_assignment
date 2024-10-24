import 'package:flutter/material.dart';
import 'package:meragi_assignment/providers/login_view_model.dart';
import 'package:meragi_assignment/utils/app_colors.dart';
import 'package:provider/provider.dart';

class DesktopHeader extends StatefulWidget {

  @override
  State<DesktopHeader> createState() => _DesktopHeaderState();
}

class _DesktopHeaderState extends State<DesktopHeader> {

  void _togglePasswordVisibility() {
    Provider.of<LoginViewModel>(context, listen: false).updatePasswordVisibility();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 70.0,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/design.png', width: 30,),
              SizedBox(width: 8),
              Text(
                'Design Guild',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkBrown,
                ),
              ),
            ],
          ),
          Form(
            key: viewModel.formKey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 250,
                  child: TextFormField(
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
                ),
                SizedBox(width: 24,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      child: TextFormField(
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
                    ),
                    SizedBox(height: 12,),
                    Text(
                      'Forgot password?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.darkBrown,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 24,),
                Container(
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
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
