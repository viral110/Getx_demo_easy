import 'dart:convert';

HomeModel welcomeFromJson(String str) => HomeModel.fromJson(json.decode(str));

String welcomeToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.success,
  });

  int? success;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}