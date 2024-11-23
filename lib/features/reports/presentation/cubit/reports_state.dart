part of 'reports_cubit.dart';

abstract class ReportsState {}

class ReportsInitial extends ReportsState {}

class ReportsLoaded extends ReportsState {
  final String? selectedCar;
  final String? selectedService;

  ReportsLoaded({this.selectedCar, this.selectedService});
}