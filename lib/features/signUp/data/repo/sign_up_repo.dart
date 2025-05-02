

import 'package:advanced_project/core/networking/api_error_handler.dart' show ErrorHandler;
import 'package:advanced_project/core/networking/api_services.dart';
import 'package:advanced_project/features/signUp/data/models/signUp_response.dart';
import 'package:advanced_project/features/signUp/data/models/signup_request_body.dart';

import '../../../../core/networking/api_result.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}