import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {

  @JsonKey(name: "login")
  final String login;

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "avatar_url")
  final String avatarUrl;

  User(this.login, this.id, this.avatarUrl);

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}