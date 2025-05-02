import 'package:advanced_project/core/helpers/constans.dart';
import 'package:advanced_project/core/routing/app_router.dart';
import 'package:advanced_project/core/routing/routes.dart';
import 'package:advanced_project/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: "Doc App",
        theme: ThemeData(
          primaryColor: ColorsManager.mainblue,
          scaffoldBackgroundColor: Colors.white,
        ),

        debugShowCheckedModeBanner: false,

         initialRoute: isLoggedInUser ? Routes.HomeScreen : Routes.LoginScreen,

        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
