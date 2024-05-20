import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

enum Roles {
  teacher,
  admin,
}

@JsonSerializable()
class User {
  final String? id;
  final String? fullname;
  final String? email;
  final String? password;
  final String? documents;
  final String? workExperience;
  final String? degree;
  final String? role;
  final String? diplome;

  User(
      {required this.id,
      required this.fullname,
      required this.email,
      required this.password,
      required this.documents,
      required this.workExperience,
      required this.degree,
      required this.role,
      required this.diplome});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Document {
  final String? id;
  final String? name;
  final String? userId;
  final String? downloadUrl;
  final String? date;
  final String? perechen;
  final String? interWorks;
  final String? interConfWorks;
  final String? nameBook;
  final List<String>? authors;

  Document({
    required this.id,
    required this.name,
    required this.userId,
    required this.downloadUrl,
    required this.date,
    required this.perechen,
    required this.interWorks,
    required this.interConfWorks,
    required this.nameBook,
    required this.authors,
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

   Map<String, dynamic> toJson() => _$DocumentToJson(this);
}
