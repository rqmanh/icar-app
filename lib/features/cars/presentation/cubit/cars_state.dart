part of 'cars_cubit.dart';


abstract class CarsState extends Equatable {
  const CarsState();

  @override
  List<Object> get props => [];
}

class CarsInitial extends CarsState {}

class CarsLoading extends CarsState {}

class CarsLoaded extends CarsState {
  final List<Car> cars;

  const CarsLoaded({required this.cars});

  @override
  List<Object> get props => [cars];
}

class CarsError extends CarsState {
  final String message;

  const CarsError({required this.message});

  @override
  List<Object> get props => [message];
}
