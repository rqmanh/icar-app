import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(ReportsInitial());

  void selectCar(String car) {
    emit(ReportsLoaded(
      selectedCar: car,
      selectedService: (state is ReportsLoaded)
          ? (state as ReportsLoaded).selectedService
          : null,
    ));
  }

  void selectService(String service) {
    emit(ReportsLoaded(
      selectedCar: (state is ReportsLoaded)
          ? (state as ReportsLoaded).selectedCar
          : null,
      selectedService: service,
    ));
  }

  List<Report> getReports(String? selectedCar, String? selectedService) {
    final allReports = [
      Report(
          "تغيير الزيت - سيارة هيونداي -  بايون يون",
          "150 ر.س",
          "2022",
          "5000 كيلومتر km",
          "01.11.2024",
          "نص يمكن استبداله بنفس المكان نص يمكن استبداله بنفس المكان"),
      Report("فحص الفرامل - سيارة هيونداي -  بايون يون", "150 ر.س", "2021",
          "5000 كيلومتر km", "01.11.2024", "Tires replaced"),
      Report("فحص الاطارات - سيارة هيونداي -  بايون يون", "150 ر.س", "2023",
          "5000 كيلومتر km", "01.11.2024", "Basic car wash"),
    ];

    return allReports.where((report) {
      final carMatch =
          selectedCar == null || report.title.contains(selectedCar);
      final serviceMatch =
          selectedService == null || report.title.contains(selectedService);
      return carMatch && serviceMatch;
    }).toList();
  }

  IconData getIconForService(String serviceTitle) {
    final serviceIcons = {
      'زيت': Icons.oil_barrel,
      'الاطارات': Icons.tire_repair,
      'غسيل': Icons.local_car_wash,
    };

    for (var entry in serviceIcons.entries) {
      if (serviceTitle.contains(entry.key)) return entry.value;
    }
    return Icons.miscellaneous_services;
  }
}

class Report {
  final String title;
  final String price;
  final String year;
  final String odometerReading;
  final String date;
  final String notes;

  Report(this.title, this.price, this.year, this.odometerReading, this.date,
      this.notes);
}
