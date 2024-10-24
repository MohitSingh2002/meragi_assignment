import 'package:flutter/material.dart';
import 'package:meragi_assignment/screens/desktop/views/social_button.dart';
import 'package:meragi_assignment/utils/app_colors.dart';

class SignupOptions extends StatelessWidget {
  const SignupOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Join our\ncommunity today',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.darkBrown,
          ),
        ),
        SizedBox(height: 16,),
        Text(
          'Get connected, find designers to start a project',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: AppColors.darkBrown,
          ),
        ),
        SizedBox(height: 48,),
        Column(
          children: [
            Container(
              width: 250,
              decoration: BoxDecoration(
                gradient: AppColors.gradient,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24,),
            Text(
              'Or, login with',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.darkPurple,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(platform: 'Facebook'),
                SizedBox(width: 16,),
                SocialButton(platform: 'LinkedIn'),
                SizedBox(width: 16,),
                SocialButton(platform: 'Google'),
              ],
            ),
          ],
        ),
      ],
    );
  }

}
