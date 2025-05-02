import 'package:advanced_project/core/networking/api_constens.dart';
import 'package:advanced_project/features/data/models/login_request_body.dart';
import 'package:advanced_project/features/data/models/login_response.dart';
import 'package:advanced_project/features/signUp/data/models/signUp_response.dart';
import 'package:advanced_project/features/signUp/data/models/signup_request_body.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';



part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
@POST(ApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );
  
}