import 'package:advanced_project/core/di/dependency_injection.dart';
import 'package:advanced_project/core/helpers/constans.dart';
import 'package:advanced_project/core/helpers/exetinsion.dart';
import 'package:advanced_project/core/helpers/shared_pref_helper.dart';
import 'package:advanced_project/core/routing/app_router.dart';
import 'package:advanced_project/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await checkIfLoggedInUser();
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(appRouter: AppRouter()));
}
checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}