class RegisterEntity {
  RegisterEntity({
    this.user,
    this.token,
  });

  RegisterEntity.fromJson(dynamic json) {
    user = json['user'] != null ? UserEntity.fromJson(json['user']) : null;
    token = json['token'];
  }

  UserEntity? user;
  String? token;
}

class UserEntity {
  UserEntity({
    this.name,
    this.email,
  });

  UserEntity.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
  }

  String? name;
  String? email;
}
