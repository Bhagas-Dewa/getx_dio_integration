import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    final Data? data;
    final Support? support;

    UserModel({
        this.data,
        this.support,

    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        support: json["support"] == null ? null : Support.fromJson(json["support"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "support": support?.toJson(),
    };
}

class Data {
    final int id;
    final String email;
    final String firstName;
    final String lastName;
    final String? avatar;
    

    Data({
      required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        avatar: json['avatar'],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
    };
}

class Support {
    final String? url;
    final String? text;

    Support({
        this.url,
        this.text,
    });

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
    };
}
