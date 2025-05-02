import 'package:advanced_project/core/helpers/exetinsion.dart';
import 'package:advanced_project/core/routing/routes.dart';
import 'package:advanced_project/core/theming/colors.dart';
import 'package:advanced_project/core/theming/textstyle.dart';
import 'package:advanced_project/features/data/models/login_response.dart';
import 'package:advanced_project/features/logic/cubit/login_cubit.dart';
import 'package:advanced_project/features/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListner extends StatelessWidget {
  const LoginBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder:
                  (context) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainblue,
                    ),
                  ),
            );
          },
          success: (LoginResponse) {
            context.pob();
            context.pushnamed(Routes.HomeScreen);
          },
          error: (error) {
            context.pob();

            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    icon: const Icon(Icons.error, color: Colors.red, size: 32),
                    content: Text(
                      error,
                      style: Textstyles.font14DarkBlueMedium,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          context.pob();
                        },
                        child: Text(
                          'Got it',
                          style: Textstyles.font11BlueRegular,
                        ),
                      ),
                    ],
                  ),
            );
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
