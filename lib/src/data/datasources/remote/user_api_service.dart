import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/utils/constants.dart';
import '../../models/login_response_model.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: kUserApiUrl)
abstract class UserApiService {
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;

  @POST('/login')
  Future<HttpResponse<LoginResponseModel>> login(
      @Body() Map<String, dynamic> map);
}
