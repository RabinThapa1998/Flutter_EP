// To parse this JSON data, do
//
//     final Sets = SetsFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Sets {
  Sets({
    required this.data,
  });

  List<SetItem> data;

  factory Sets.fromJson(String str) => Sets.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sets.fromMap(Map<String, dynamic> json) => Sets(
        data: List<SetItem>.from(json["data"].map((x) => SetItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class SetItem {
  SetItem({
    required this.name,
    required this.questions,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  String name;
  List<String> questions;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory SetItem.fromJson(String str) => SetItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SetItem.fromMap(Map<String, dynamic> json) => SetItem(
        name: json["name"],
        questions: List<String>.from(json["questions"].map((x) => x)),
        active: json["active"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "questions": List<dynamic>.from(questions.map((x) => x)),
        "active": active,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}
