class UserEntity {
  final int id;
  final String name;
  final String phoneNumber;
  final String avatar;
  final String gender;
  final String country;
  final String city;

  UserEntity({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.avatar,
    required this.gender,
    required this.country,
    required this.city,
  });
}

class CityEntity {
  final String id;
  final String name;

  CityEntity({required this.id, required this.name});
}

class CountryEntity {
  final String id;
  final String name;

  CountryEntity({required this.id, required this.name});
}
