import 'dart:convert';

CreateUserModel createUserModelFromJson(String str) => CreateUserModel.fromJson(json.decode(str));

String createUserModelToJson(CreateUserModel data) => json.encode(data.toJson());

class CreateUserModel {
  final String name;
  final String job;
  final String email;
  final String? id;
  final String? createdAt;

  CreateUserModel({
    required this.name,
    required this.job,
    required this.email,
    this.id, 
    this.createdAt,
  });

  factory CreateUserModel.fromJson(Map<String, dynamic> json) => CreateUserModel(
        name: json["name"],
        job: json["job"],
        email: json ["email"],
        id: json["id"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "email": email,
      };
}
