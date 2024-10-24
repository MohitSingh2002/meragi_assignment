import 'package:flutter/material.dart';
import 'package:meragi_assignment/screens/desktop/views/signup_options.dart';
import 'package:meragi_assignment/utils/app_colors.dart';

class DesktopContent extends StatelessWidget {
  const DesktopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to Design Guild',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkBrown,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Join the world's largest community for designers",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: AppColors.darkBrown,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40,),
                      Text(
                        "Recent Logins",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkBrown,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),
                      recentLogins(),
                    ],
                  ),
                  SizedBox(height: 24),
                  SignupOptions(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget recentLogins() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            userAvatar('assets/aliana.png', 'Aliana Hepburn'),
            SizedBox(width: 16),
            userAvatar('assets/andrew.png', 'Andrew Pochink'),
            SizedBox(width: 16),
            addNewAccountButton(),
          ],
        ),
      ],
    );
  }

  Widget userAvatar(String imagePath, String name) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.lightBrown,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 8),
          Text(
            '${name}',
            style: TextStyle(
              color: AppColors.darkBrown,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget addNewAccountButton() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.lightBrown,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.lightBrown1,
            child: Icon(Icons.add,),
          ),
          SizedBox(height: 8),
          Text(
            'Add Account',
            style: TextStyle(
              color: AppColors.darkBrown,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

}
