// // lib/features/auth/data/models/user_profile_model.dart

// import 'package:json_annotation/json_annotation.dart';
// import 'package:icar/features/authentication/domain/entities/user_profile.dart';

// part 'user_profile_model.g.dart';

// @JsonSerializable()
// class UserProfileModel extends UserProfile {
//   UserProfileModel({
//     required String id,
//     required String name,
//     required String fakeName,
//     required String photo,
//     required String photoCover,
//     required String gender,
//     required DateTime birthdate,
//     required String email,
//   }) : super(
//           id: id,
//           name: name,
//           fakeName: fakeName,
//           photo: photo,
//           photoCover: photoCover,
//           gender: gender,
//           birthdate: birthdate,
//           email: email,
//         );

//   factory UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);
//   Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
// }
