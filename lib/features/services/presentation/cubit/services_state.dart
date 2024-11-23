class Car {
  final String id;
  final String brand;
  final String type;
  final String model;
  final String licensePlateArabic;
  final String licensePlateEnglish;
  final String imageUrl;

  Car({
    required this.id,
    required this.brand,
    required this.type,
    required this.model,
    this.licensePlateArabic = '',
    this.licensePlateEnglish = '',
    this.imageUrl = '',
  });
}
class ServicesState {
  final bool isLoading;
  final List<Car> cars;
  final Car? selectedCar;

  ServicesState({
    this.isLoading = false,
    this.cars = const [],
    this.selectedCar,
  });

  ServicesState copyWith({
    bool? isLoading,
    List<Car>? cars,
    Car? selectedCar,
  }) {
    return ServicesState(
      isLoading: isLoading ?? this.isLoading,
      cars: cars ?? this.cars,
      selectedCar: selectedCar ?? this.selectedCar,
    );
  }
}