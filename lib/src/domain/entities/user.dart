import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.surname,
    required this.roleId,
    required this.phonenumber,
    required this.avatar,
    required this.companyId,
  });
  final String id;
  final String email;
  final String name;
  final String surname;
  final String roleId;
  final String phonenumber;
  final String avatar;
  final String companyId;

  @override
  List<Object> get props => [
        id,
        email,
        name,
        surname,
        roleId,
        phonenumber,
        avatar,
        companyId,
      ];

  @override
  bool get stringify => true;
}
