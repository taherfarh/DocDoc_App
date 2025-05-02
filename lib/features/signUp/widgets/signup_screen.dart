import 'package:advanced_project/core/theming/textstyle.dart';
import 'package:advanced_project/core/widgets/app_text_button.dart';
import 'package:advanced_project/features/signUp/logic/cubit/sign_up_cubit.dart';
import 'package:advanced_project/features/signUp/widgets/sign_up_bloc_listner.dart';
import 'package:advanced_project/features/signUp/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: Textstyles.font24BlueBold,
                ),
                verticalspacing(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: Textstyles.font14LightGreyRegular,
                ),
                verticalspacing(36),
                Column(
                  children: [
                    const SignupForm(),
                    verticalspacing(40),
                    AppTextButton(
                      buttonText: "Create Account",
                      textStyle: Textstyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    verticalspacing(16),
                     RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "By logining you are agree to our ",
                        style: Textstyles.font13GreyRegular,
                      ),
                      TextSpan(
                        text: "Terms & Conditions ",
                        style: Textstyles.font14DarkBlueMedium,
                      ),
                      TextSpan(
                        text: "and ",
                        style: Textstyles.font13GreyRegular.copyWith(
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: "PrivacyPolicy",
                        style: Textstyles.font14DarkBlueMedium,
                      ),
                    ],
                  ),
                ),

                    verticalspacing(30),
                    Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Dont Have an account yet? ",
                          style: Textstyles.font11BlackRegular,
                        ),

                        TextSpan(
                          text: "Sign Up",
                          style: Textstyles.font11BlueRegular,
                        ),
                      ],
                    ),
                  ),
                ),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}