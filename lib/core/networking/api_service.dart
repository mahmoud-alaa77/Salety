import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task1intern/core/networking/api_constants.dart';
import 'package:task1intern/features/auth/login/data/models/request_model.dart';

import '../../features/auth/login/data/models/response_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<ResponseModel> login(@Body() RequestModel requestModel);

}