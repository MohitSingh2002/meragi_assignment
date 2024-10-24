import 'package:flutter/material.dart';
import 'package:meragi_assignment/screens/desktop/views/desktop_content.dart';
import 'package:meragi_assignment/screens/desktop/views/desktop_header.dart';
import 'package:meragi_assignment/utils/app_colors.dart';

class DesktopPage extends StatefulWidget {
  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DesktopHeader(),
            SizedBox(height: 80,),
            DesktopContent(),
            Spacer(),
            footerWidget(),
          ],
        ),
      ),
    );
  }

  Widget footerWidget() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        gradient: AppColors.gradient,
      ),
    );
  }
}
