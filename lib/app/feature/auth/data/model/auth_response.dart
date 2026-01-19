import 'package:json_annotation/json_annotation.dart';

import '../../../profile/domain/model/user_entity.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthDto {
  String? message;
  User? user;
  String? token;

  AuthDto({this.message, this.user, this.token});

  factory AuthDto.fromJson(Map<String, dynamic> json) =>
      _$AuthDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDtoToJson(this);

  UserEntity toUserEntity() {
    return UserEntity(
      firstName: user?.firstName,
      email: user?.email,
      photo: user?.photo,
    );
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  String? sId;

  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;

  List<dynamic>? wishlist;
  List<dynamic>? addresses;

  String? createdAt;

  User({
    this.sId,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.addresses,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
