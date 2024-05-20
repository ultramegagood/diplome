// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      documents: json['documents'] as String?,
      workExperience: json['workExperience'] as String?,
      degree: json['degree'] as String?,
      role: json['role'] as String?,
      diplome: json['diplome'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'email': instance.email,
      'password': instance.password,
      'documents': instance.documents,
      'workExperience': instance.workExperience,
      'degree': instance.degree,
      'role': instance.role,
      'diplome': instance.diplome,
    };

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      id: json['id'] as String?,
      name: json['name'] as String?,
      userId: json['userId'] as String?,
      downloadUrl: json['downloadUrl'] as String?,
      date: json['date'] as String?,
      perechen: json['perechen'] as String?,
      interWorks: json['interWorks'] as String?,
      interConfWorks: json['interConfWorks'] as String?,
      nameBook: json['nameBook'] as String?,
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'downloadUrl': instance.downloadUrl,
      'date': instance.date,
      'perechen': instance.perechen,
      'interWorks': instance.interWorks,
      'interConfWorks': instance.interConfWorks,
      'nameBook': instance.nameBook,
      'authors': instance.authors,
    };
