import 'package:advanced_project/core/helpers/exetinsion.dart';
import 'package:advanced_project/core/routing/routes.dart';
import 'package:advanced_project/core/theming/textstyle.dart';
import 'package:flutter/material.dart';

class Getstartedbutton extends StatelessWidget {
  final String textbutton;
  final VoidCallback onpressed;
  const Getstartedbutton({super.key, required this.textbutton, required this.onpressed});

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

      onPressed: onpressed ,
        
      
      child: Text(textbutton, style: Textstyles.font16WhiteSemiBold),
    );
  }
}
