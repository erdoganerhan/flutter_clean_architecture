class LoginResponseModel {
  LoginResponseModel({
    required this.token,
    required this.user,
  });
  late final String token;
  late final User user;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.email,
    required this.name,
    required this.surname,
    required this.roleId,
    required this.phonenumber,
    required this.avatar,
    required this.companyId,
  });
  late final String id;
  late final String email;
  late final String name;
  late final String surname;
  late final String roleId;
  late final String phonenumber;
  late final String avatar;
  late final String companyId;

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    name = json['name'];
    surname = json['surname'];
    roleId = json['roleId'];
    phonenumber = json['phonenumber'];
    avatar = json['avatar'];
    companyId = json['companyId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['email'] = email;
    _data['name'] = name;
    _data['surname'] = surname;
    _data['roleId'] = roleId;
    _data['phonenumber'] = phonenumber;
    _data['avatar'] = avatar;
    _data['companyId'] = companyId;
    return _data;
  }
}
