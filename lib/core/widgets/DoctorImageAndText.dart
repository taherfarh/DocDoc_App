import 'package:advanced_project/core/theming/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Doctorimageandtext extends StatelessWidget {
  const Doctorimageandtext({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/Group.png"),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white.withOpacity(0.0)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.14, 0.4],
            ),
          ),

          child: Image.asset("assets/images/Image-1.png"),
        ),

        Positioned(
          bottom: 30,
          left: 0,
          right: 0,

          child: Text(
            "Best Doctor\nAppointment App",
            textAlign: TextAlign.center,
            style: Textstyles.font32BlueBold.copyWith(height: 1.4),
          ),
        ),
      ],
    );
  }
}
