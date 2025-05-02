import 'package:advanced_project/core/networking/api_services.dart';
import 'package:advanced_project/core/networking/dio_factory.dart';
import 'package:advanced_project/features/data/repos/login_repo.dart';
import 'package:advanced_project/features/home/data/apis/home_api_service.dart';
import 'package:advanced_project/features/home/data/repos/home_repos.dart';
import 'package:advanced_project/features/logic/cubit/login_cubit.dart';
import 'package:advanced_project/features/signUp/data/repo/sign_up_repo.dart';
import 'package:advanced_project/features/signUp/logic/cubit/sign_up_cubit.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import 'package:advanced_project/features/logic/cubit/login_cubit.dart';
import 'package:advanced_project/features/data/repos/login_repo.dart';




final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));


  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}