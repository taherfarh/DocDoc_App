import 'package:advanced_project/core/routing/routes.dart';
import 'package:advanced_project/features/loginScreen/LoginScreen.dart';
import 'package:advanced_project/features/onboardingscreen/onboarding.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.OnboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.LoginScreen:
        return MaterialPageRoute(builder: (_) => const Loginscreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text("No Route Defined For ${settings.name}"),
                ),
              ),
        );
    }
  }
}
