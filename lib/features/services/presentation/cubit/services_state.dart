class Car {
  final int id;
  final String brand;
  final String type;
  final String model;
  final String licensePlateArabic;
  final String licensePlateEnglish;
  final String imageUrl;
  final bool isActive;

  Car( {
    required this.id,
    required this.brand,
    required this.type,
    required this.model,
    this.licensePlateArabic = '',
    this.licensePlateEnglish = '',
    this.imageUrl = '',
    this.isActive =false
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