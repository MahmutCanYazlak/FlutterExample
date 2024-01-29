// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int id;
  String name;
  String surname;
  String age;
  String imageUrl;
  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.age,
    required this.imageUrl,
  });

  User copyWith({
    int? id,
    String? name,
    String? surname,
    String? age,
    String? imageUrl,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      age: age ?? this.age,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'surname': surname,
      'age': age,
      'imageUrl': imageUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      surname: map['surname'] as String,
      age: map['age'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, surname: $surname, age: $age, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.surname == surname &&
        other.age == age &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        age.hashCode ^
        imageUrl.hashCode;
  }
}
