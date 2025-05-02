import 'package:advanced_project/core/networking/api_constens.dart';
import 'package:advanced_project/features/home/data/apis/home_api_constins.dart';
import 'package:advanced_project/features/home/data/models/specialization_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart' show ParseErrorLogger;
import 'package:retrofit/http.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl : ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApiConstants.specializationEP)
  Future<SpecializationsResponseModel> getSpecialization();
}