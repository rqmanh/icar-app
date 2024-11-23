import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/widgets/custom_dropdown_field.dart';
import 'package:icar/features/reports/presentation/cubit/reports_cubit.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReportsCubit>();
    final TextEditingController selectedCar = TextEditingController();
    final TextEditingController selectedService = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('التقارير'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: BlocBuilder<ReportsCubit, ReportsState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Align(
                //   alignment: Alignment.topRight,
                //   child: Text(
                //     'اختر السيارة والخدمة المراد عرض تقريرها',
                //     style: CTextStyles.font14BlackMedium,
                //   ),
                // ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomDropdownField(
                        controller: selectedCar,
                        label: 'السيارات',
                        hintText: AppKeys.select,
                        options: const ["تايوتا", "سيارة هيونداي", "فورد"],
                        onSelected: (car) => cubit.selectCar(car),
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: CustomDropdownField(
                        controller: selectedService,
                        label: 'الخدمات',
                        hintText: AppKeys.select,
                        options: const [
                          "تغيير الزيت",
                          "فحص الاطارات",
                          "فحص الفرامل"
                        ],
                        onSelected: (service) => cubit.selectService(service),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: BlocBuilder<ReportsCubit, ReportsState>(
                    builder: (context, state) {
                      final selectedCar =
                          state is ReportsLoaded ? state.selectedCar : null;
                      final selectedService =
                          state is ReportsLoaded ? state.selectedService : null;
                      final reports =
                          cubit.getReports(selectedCar, selectedService);

                      if (reports.isEmpty) {
                        return const Center(child: Text('No reports found'));
                      }
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: CColors.white,
                            border: Border.all(
                              color: CColors.borderColor,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: ListView.builder(
                          itemCount: reports.length,
                          itemBuilder: (context, index) {
                            return ReportTimelineTile(
                              report: reports[index],
                              isFirst: index == 0,
                              isLast: index == reports.length - 1,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ReportTimelineTile extends StatelessWidget {
  final Report report;
  final bool isFirst;
  final bool isLast;

  const ReportTimelineTile(
      {super.key,
      required this.report,
      required this.isFirst,
      required this.isLast});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReportsCubit>();

    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.15,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        
        width: 30,
        height: 30,
       indicatorXY: 0.2,
       
        color: CColors.primaryColor,
        // padding: const EdgeInsets.symmetric(horizontal: 10),
        iconStyle: IconStyle(
          iconData: cubit.getIconForService(report.title),
          color: Colors.white,
        ),
      ),
      beforeLineStyle: const LineStyle(
        color: CColors.primaryColor,
        thickness: 2,
      ),
      afterLineStyle: const LineStyle(
        color: CColors.primaryColor,
        thickness: 2,
      ),
      
     startChild: Padding(
    padding: EdgeInsets.zero,
    child: Column(
      children: [
        20.verticalSpace,
        Text(
          report.year,
          style: CTextStyles.font12BlackMedium,
        ),
      ],
    ),
  ),
      endChild: Padding(
        padding: const EdgeInsets.only(right: 10, top: 10),
        child: Card(
          color: CColors.scafBackgroundColor,
          elevation: 0,
          shadowColor: CColors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        report.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: CColors.primaryColor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              report.price,
                              style: CTextStyles.font12PrimaryMedium,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text("قراءة العداد: ${report.odometerReading}"),
                Text("تاريخ التنبيه: ${report.date}"),
                Text("ملاحظات: ${report.notes}"),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
