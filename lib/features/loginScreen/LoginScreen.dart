import 'package:advanced_project/core/helpers/Spacing.dart';
import 'package:advanced_project/core/helpers/exetinsion.dart';
import 'package:advanced_project/core/routing/routes.dart';
import 'package:advanced_project/core/theming/textstyle.dart';
import 'package:advanced_project/core/widgets/GetstartedButton.dart';
import 'package:advanced_project/core/widgets/app_text_form_field.dart';
import 'package:advanced_project/features/logic/cubit/login_cubit.dart';
import 'package:advanced_project/features/loginScreen/login_bloc_listner.dart';
import 'package:advanced_project/features/ui/email_and_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
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
                Text("Welcome Back", style: Textstyles.font24BlueBold),
                verticalspacing(8),

                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: Textstyles.font13GreyRegular,
                ),
                verticalspacing(36),

                Column(
                  children: [
                    EmailAndPassword(),

                    verticalspacing(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: GestureDetector(
                        child: Text(
                          "Forget Password?",
                          style: Textstyles.font13BlueRegular,
                        ),
                      ),
                    ),
                    verticalspacing(13),
                  ],
                ),
                verticalspacing(20),
                Getstartedbutton(
                  textbutton: "Login",
                  onpressed: () {
                    ValidateThenDoLogin(context);
                  },
                ),
                verticalspacing(20),

                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        "Or Login With",
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                  ],
                ),
                verticalspacing(20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    SocialCircleButton(
                      iconPath: 'assets/images/facebook_logo.png',
                    ),
                    SizedBox(width: 20),
                    SocialCircleButton(
                      iconPath: 'assets/images/google_logo.png',
                    ),
                  ],
                ),

                verticalspacing(15),
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

                verticalspacing(15),

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
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  context.pushRepleacmentNamed(
                                    Routes.signUpScreen,
                                  );
                                },
                        ),
                      ],
                    ),
                  ),
                ),
                LoginBlocListner(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void ValidateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}

class SocialCircleButton extends StatelessWidget {
  final String iconPath;

  const SocialCircleButton({Key? key, required this.iconPath})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.grey.shade200,
      child: Image.asset(iconPath, height: 25, width: 25),
    );
  }
}
