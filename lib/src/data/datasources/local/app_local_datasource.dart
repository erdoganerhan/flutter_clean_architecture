import 'package:shared_preferences/shared_preferences.dart';

abstract class AppLocalDataSource {
  Future<String> getToken();
  Future<void> setToken(String token);
}

class AppLocalDataSourceImpl implements AppLocalDataSource {
  final SharedPreferences sharedPreferences;
  AppLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<String> getToken() {
    final token = sharedPreferences.getString('token');
    if (token != null) {
      return Future.value(token);
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> setToken(String token) {
    return sharedPreferences.setString('token', token);
  }
}
