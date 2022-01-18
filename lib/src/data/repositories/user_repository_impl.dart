import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/data/datasources/local/app_local_datasource.dart';
import 'package:flutter_clean_architecture/src/domain/entities/user.dart';
import 'package:flutter_clean_architecture/src/core/params/base_request.dart';

import '../../core/resources/data_state.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/remote/user_api_service.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService _userApiService;
  final AppLocalDataSource _appLocalDataSource;
  const UserRepositoryImpl(this._userApiService, this._appLocalDataSource);
  @override
  Future<DataState<String>> login(Map<String, dynamic> body) async {
    try {
      final httpResponse = await _userApiService.login(body);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        _appLocalDataSource.setToken(httpResponse.data.token);
        return DataSuccess(httpResponse.data.token);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<User>> getUser(BaseRequestParams params) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
