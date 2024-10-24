import 'package:flutter/material.dart';
import 'package:meragi_assignment/utils/app_colors.dart';
import 'package:meragi_assignment/utils/app_font_family.dart';

class SocialButton extends StatelessWidget {

  String platform;

  SocialButton({required this.platform});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.darkPurple,),
      ),
      child: Center(
        child: Text(
          '${platform}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.darkPurple,
            fontFamily: AppFontFamily.fontInter,
          ),
        ),
      ),
    );
  }
}
