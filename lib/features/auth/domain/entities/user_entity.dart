class UserEntity {
  final int id;
  final String name;
  final String email;
  final String? phoneNumber;
  final String? avatar;
  final String? gender;
  final String? country;
  final String? city;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.avatar,
    this.gender,
    this.country,
    this.city,
  });
}
