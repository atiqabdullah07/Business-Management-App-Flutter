// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
  Posts({
    required this.data,
    required this.status,
  });

  List<Datum> data;
  String status;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
      };
}

class Datum {
  Datum({
    required this.settingId,
    required this.settingName,
    required this.status,
  });

  String settingId;
  String settingName;
  String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        settingId: json["setting_id"],
        settingName: json["setting_name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "setting_id": settingId,
        "setting_name": settingName,
        "status": status,
      };
}
