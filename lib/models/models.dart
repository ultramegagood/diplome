class User {
  String? id;
  String? fullname;
  String? email;
  String? password;
  String? documents;
  String? workExperience;
  String? degree;
  String? diplome;

  User({this.id, this.fullname, this.email, this.password, this.documents, this.workExperience, this.degree, this.diplome});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
      'email': email,
      'password': password,
      'documents': documents,
      'workExperience': workExperience,
      'degree': degree,
      'diplome': diplome,
    };
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    fullname = map['fullname'];
    email = map['email'];
    password = map['password'];
    documents = map['documents'];
    workExperience = map['workExperience'];
    degree = map['degree'];
    diplome = map['diplome'];
  }
}

class Document {
  String? id;
  String? name;
  String? userId;
  String? downloadUrl;

  Document({this.id, this.name, this.userId,this.downloadUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userId': userId,
      'downloadUrl':downloadUrl
    };
  }

  factory Document.fromMap(Map<String, dynamic> map) {
    return Document(
      id: map['id'],
      name: map['name'],
      userId: map['userId'],
      downloadUrl: map['downloadUrl'],
    );
  }
}
