import 'package:advanced_project/core/theming/textstyle.dart';
import 'package:advanced_project/core/widgets/DocLogoAndName/DocLogoAndName.dart';
import 'package:advanced_project/core/widgets/DoctorImageAndText.dart';
import 'package:advanced_project/core/widgets/GetstartedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              children: [
                DocLogoAndName(),
                SizedBox(height: 30.h),

                Doctorimageandtext(),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    children: [
                      Text(
                        "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                        style: Textstyles.font13GreyRegular,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h,),

                Getstartedbutton()

              ],
            ),
          ),
        ),
      ),
    );
  }
}
