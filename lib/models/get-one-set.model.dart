// To parse this JSON data, do
//
//     final SetDetails = SetDetailsFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class SetDetails {
  SetDetails({
    required this.data,
  });

  SetItemDetail data;

  factory SetDetails.fromJson(String str) =>
      SetDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SetDetails.fromMap(Map<String, dynamic> json) => SetDetails(
        data: SetItemDetail.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class SetItemDetail {
  SetItemDetail({
    required this.name,
    required this.questions,
    required this.description,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  String name;
  List<Question> questions;
  String description;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory SetItemDetail.fromJson(String str) =>
      SetItemDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SetItemDetail.fromMap(Map<String, dynamic> json) => SetItemDetail(
        name: json["name"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromMap(x))),
        description: json["description"],
        active: json["active"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "questions": List<dynamic>.from(questions.map((x) => x.toMap())),
        "description": description,
        "active": active,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}

class Question {
  Question({
    required this.question,
    required this.options,
    required this.correct,
    required this.selected,
    required this.sets,
    required this.description,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  String question;
  List<Option> options;
  int correct;
  var selected;
  String sets;
  String description;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory Question.fromJson(String str) => Question.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Question.fromMap(Map<String, dynamic> json) => Question(
        question: json["question"],
        options:
            List<Option>.from(json["options"].map((x) => Option.fromMap(x))),
        correct: json["correct"],
        selected: json["selected"],
        sets: json["sets"],
        description: json["description"],
        active: json["active"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "question": question,
        "options": List<dynamic>.from(options.map((x) => x.toMap())),
        "correct": correct,
        "selected": selected,
        "sets": sets,
        "description": description,
        "active": active,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}

class Option {
  Option({
    required this.option,
    required this.index,
    required this.id,
  });

  String option;
  int index;
  String id;

  factory Option.fromJson(String str) => Option.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Option.fromMap(Map<String, dynamic> json) => Option(
        option: json["option"],
        index: json["index"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "option": option,
        "index": index,
        "_id": id,
      };
}
