import 'package:icar/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.phoneNumber,
    required super.avatar,
    required super.gender,
    required super.country,
    required super.city,
  });

  // Factory constructor to create a UserModel from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      avatar: json['avatar'],
      gender: json['gender'],
      country: json['country'],
      city: json['city'],
    );
  }

  // Method to convert UserModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'avatar': avatar,
      'gender': gender,
      'country': country,
      'city': city,
    };
  }
}

class CitiesModel extends CityEntity {
  CitiesModel({required super.id, required super.name});

  factory CitiesModel.fromJson(Map<String, dynamic> json) {
    return CitiesModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  //toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class CountryModel extends CountryEntity {
  CountryModel({
    required super.id,
    required super.name,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  //toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
