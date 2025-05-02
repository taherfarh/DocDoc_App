import 'package:advanced_project/core/helpers/Spacing.dart';
import 'package:advanced_project/core/helpers/app_regex.dart';
import 'package:advanced_project/core/widgets/app_text_form_field.dart';
import 'package:advanced_project/features/logic/cubit/login_cubit.dart';
import 'package:advanced_project/features/ui/email_and_password.dart'
    as passwordController;
import 'package:advanced_project/features/ui/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool isobscuretext = true;

  late TextEditingController passwordcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    passwordcontroller = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordcontroller.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordcontroller.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordcontroller.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordcontroller.text,
        );
        hasNumber = AppRegex.hasNumber(passwordcontroller.text);
        hasMinLength = AppRegex.hasMinLength(passwordcontroller.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hinttetxt: "Email",
            validatour: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return "please entre a valid email";
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalspacing(20),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            // key: context.read<LoginCubit>().formKey,
            hinttetxt: "Password",
            validatour: (value) {
              if (value == null || value.isEmpty) {
                return "please entre a valid PASSWORD";
              }
            },
            isobscuretext: isobscuretext,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isobscuretext = !isobscuretext;
                });
              },
              child: Icon(
                isobscuretext ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),

          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordcontroller.dispose();
    super.dispose();
  }
}
