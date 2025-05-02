import 'package:advanced_project/core/helpers/Spacing.dart';
import 'package:advanced_project/features/ui/doctor_blue_container.dart';
import 'package:advanced_project/features/ui/doctor_see_all.dart';
import 'package:advanced_project/features/ui/doctors_list/doctora_bloc_builder.dart';
import 'package:advanced_project/features/ui/home_tob_bar.dart';
import 'package:advanced_project/features/ui/specialization_list/specialization_bloc_builder.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalspacing(24),
              const DoctorsSpecialitySeeAll(),
              verticalspacing(18),
              const SpecializationsBlocBuilder(),
              verticalspacing(8),
            ],
          ),
        ),
      ),
    );
  }
}
