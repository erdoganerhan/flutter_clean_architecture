import '../../domain/entities/user.dart';
import '../../core/params/base_request.dart';
import '../../core/resources/data_state.dart';

abstract class UserRepository {
  Future<DataState<String>> login(Map<String, dynamic> body);
  Future<DataState<User>> getUser(BaseRequestParams params);
}
