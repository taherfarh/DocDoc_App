import 'package:advanced_project/core/di/dependency_injection.dart';
import 'package:advanced_project/core/routing/routes.dart';
import 'package:advanced_project/features/data/repos/login_repo.dart';
import 'package:advanced_project/features/home/logic/home_cubit.dart';
import 'package:advanced_project/features/logic/cubit/login_cubit.dart';
import 'package:advanced_project/features/loginScreen/LoginScreen.dart';
import 'package:advanced_project/features/onboardingscreen/onboarding.dart';
import 'package:advanced_project/features/signUp/logic/cubit/sign_up_cubit.dart';
import 'package:advanced_project/features/signUp/widgets/signup_screen.dart';
import 'package:advanced_project/features/ui/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.OnboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.LoginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const Loginscreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.HomeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt())..getSpecializations(),
            child: const Homescreen(),
          ),
        );
      default:
        return null;
    }
  }
}