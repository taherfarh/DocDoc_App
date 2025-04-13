import 'package:advanced_project/core/helpers/exetinsion.dart';
import 'package:advanced_project/core/routing/routes.dart';
import 'package:advanced_project/core/theming/textstyle.dart';
import 'package:flutter/material.dart';

class Getstartedbutton extends StatelessWidget {
  const Getstartedbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(Size(350, 52)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),

      onPressed: () {
        context.pushnamed(Routes.LoginScreen);
      },
      child: Text("Get Started", style: Textstyles.font16WhiteSemiBold),
    );
  }
}
