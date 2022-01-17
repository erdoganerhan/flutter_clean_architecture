import '../../core/resources/data_state.dart';

abstract class AuthenticationRepository {
  Future<DataState<void>> logIn({String email, String password});
  Future<DataState<void>> logOut({String email});
}
