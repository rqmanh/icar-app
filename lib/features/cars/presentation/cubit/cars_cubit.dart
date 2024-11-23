import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icar/features/services/presentation/cubit/services_state.dart';

part 'cars_state.dart';

class CarsCubit extends Cubit<CarsState> {
  CarsCubit() : super(CarsInitial());

  final List<Car> _cars = [
    Car(
      id: 1,
      brand: 'Hyundai',
      type: 'SUV',
      model: '2022',
      licensePlateArabic: 'أ ب 1234',
      licensePlateEnglish: 'AB1234',
      imageUrl: 'assets/images/car1.png',
      isActive: true,
    ),
    Car(
      id: 2,
      brand: 'Toyota',
      type: 'Sedan',
      model: '2023',
      licensePlateArabic: 'س ي 5678',
      licensePlateEnglish: 'SY5678',
      imageUrl: 'assets/images/car2.png',
      isActive: false,
    ),
  ];

  void fetchCars() async {
    emit(CarsLoading());
    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      emit(CarsLoaded(cars: List.from(_cars)));
    } catch (e) {
      emit(CarsError(message: 'Failed to load cars'));
    }
  }

  void toggleCarActiveStatus(int carId) {
    if (state is CarsLoaded) {
      final updatedCars = (state as CarsLoaded).cars.map((car) {
        if (car.id == carId) {
          return Car(
            id: car.id,
            brand: car.brand,
            type: car.type,
            model: car.model,
            licensePlateArabic: car.licensePlateArabic,
            licensePlateEnglish: car.licensePlateEnglish,
            imageUrl: car.imageUrl,
            isActive: !car.isActive,
          );
        }
        return car;
      }).toList();

      emit(CarsLoaded(cars: updatedCars));
    }
  }

  void addCar(Car car) {
    if (state is CarsLoaded) {
      final updatedCars = List<Car>.from((state as CarsLoaded).cars)..add(car);
      emit(CarsLoaded(cars: updatedCars));
    }
  }

  void removeCar(int carId) {
    if (state is CarsLoaded) {
      final updatedCars =
          (state as CarsLoaded).cars.where((car) => car.id != carId).toList();
      emit(CarsLoaded(cars: updatedCars));
    }
  }
}
