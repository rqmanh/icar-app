import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:phone_form_field/phone_form_field.dart';
part 'sign_up_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final PhoneController phoneNumberController = PhoneController(
      initialValue: const PhoneNumber(isoCode: IsoCode.SA, nsn: ''));

  SignupCubit() : super(SignupInitial());

  // This function handles the change of country.
  void changeCountry(String country) {
    emit(SignupCountryChanged(country));
    
  }

  // This function handles the change of gender
  void changeGender(String gender) {
    emit(SignupGenderChanged(gender));
  }

  // This function handles the change of city.
  void changeCity(String city) {
    emit(SignupCityChanged(city)); // Emit the new selected city.
  }

  // This function simulates fetching cities based on country (it could be an API call).
  void loadCitiesForCountry(String country) {
    // Simulate an API call for cities (just an example).
    List<String> cities = getCitiesForCountry(country);

    // Emit the new cities list.
    emit(SignupCitiesLoaded(cities: cities));
  }

  // Simulate fetching cities based on the selected country.
  List<String> getCitiesForCountry(String country) {
    // This is just an example. In a real app, you would make an API request to get cities.
    if (country == "USA") {
      return ["New York", "Los Angeles", "Chicago"];
    } else if (country == "Canada") {
      return ["Toronto", "Vancouver", "Montreal"];
    } else {
      return [];
    }
  }
}
