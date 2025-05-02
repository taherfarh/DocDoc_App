import 'package:advanced_project/core/helpers/Spacing.dart';
import 'package:advanced_project/core/theming/colors.dart';
import 'package:advanced_project/core/theming/textstyle.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalspacing(2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        verticalspacing(2),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
       verticalspacing(2),
        buildValidationRow('At least 1 number', hasNumber),
        verticalspacing(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.textGrey,
        ),
        horizontalspacing(6),
        Text(
          text,
          style: Textstyles.font14DarkBlueMedium.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.textGrey : ColorsManager.DarkBlue,
          ),
        )
      ],
    );
  }
}