import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icar/config/app_images.dart';
import 'package:icar/features/services/presentation/cubit/services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesState());

  // Fetch cars (simulate a network call or fetch from a local repository).
  Future<void> fetchCars() async {
    // If cars are already loaded, skip fetching
    if (state.cars.isNotEmpty) {
      return; // No need to make the API call if data is already loaded
    }

    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    try {
      // Example data, replace with your API or database logic.
      final cars = [
        Car(
          id: '1',
          brand: 'Toyota',
          type: 'Sedan',
          model: 'Corolla',
          licensePlateArabic: 'أ ب ج ١٢٣',
          licensePlateEnglish: 'ABC-1234',
          imageUrl: AppImages.car,
        ),
        Car(
          id: '2',
          brand: 'Honda',
          type: 'Sedan',
          model: 'Civic',
          licensePlateArabic: '',
          licensePlateEnglish: 'XYZ-5678',
          imageUrl: AppImages.car,
        ),
      ];

      // After fetching the data, update the state with the new cars list.
      emit(state.copyWith(isLoading: false, cars: cars));
    } catch (e) {
      // Handle any errors that occur during the fetch.
      emit(state.copyWith(isLoading: false));
    }
  }

  // Select a car from the list.
  void selectCar(Car car) {
    emit(state.copyWith(selectedCar: car));
  }

  // Add a new car
  void addCar(Car car) {
    final updatedCars = List<Car>.from(state.cars)..add(car);
    emit(state.copyWith(cars: updatedCars));
  }
}
