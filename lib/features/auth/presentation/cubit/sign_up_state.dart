part of 'sign_up_cubit.dart';

abstract class SignupState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupGenderChanged extends SignupState {
  final String gender;
  SignupGenderChanged(this.gender);

  @override
  List<Object> get props => [gender];
}

class SignupCountryChanged extends SignupState {
  final String country;
  SignupCountryChanged(this.country);

  @override
  List<Object> get props => [country];
}

class SignupCityChanged extends SignupState {
  final String city;
  SignupCityChanged(this.city);

  @override
  List<Object> get props => [city];
}


class SignupCountriesLoaded extends SignupState {
  final List<String> countries;
  SignupCountriesLoaded({required this.countries});

  @override
  List<Object> get props => [countries];
}

class SignupCitiesLoaded extends SignupState {
  final List<String> cities;
  SignupCitiesLoaded({required this.cities});

  @override
  List<Object> get props => [cities];
}
