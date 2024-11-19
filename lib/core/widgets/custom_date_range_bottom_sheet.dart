// import 'package:icar/config/app_colors.dart';
// import 'package:icar/config/theme/app_text_styles.dart';
// import 'package:icar/core/localization/local_keys.dart';
// import 'package:icar/core/widgets/buttons/primary_button.dart';
// import 'package:icar/utils/validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class CustomDateRangeBottomSheet extends StatelessWidget {
//   final DateTime initialFromDate;
//   final DateTime initialToDate;
//   final ValueChanged<DateTime> onFromDateSelected;
//   final ValueChanged<DateTime> onToDateSelected;

//   const CustomDateRangeBottomSheet({
//     super.key,
//     required this.initialFromDate,
//     required this.initialToDate,
//     required this.onFromDateSelected,
//     required this.onToDateSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xFF1C1C1E),
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'اختر التاريخ',
//             style: AppTextStyles.font16WhiteBold,
//           ),
//           SizedBox(height: 20.h),
//           Text(
//             'من',
//             style: AppTextStyles.font14WhiteMedium,
//           ),
//           DatePickerSpinner(
//             initialDate: initialFromDate,
//             onDateSelected: onFromDateSelected,
//           ),
//           SizedBox(height: 20.h),
//           Text(
//             'إلى',
//             style: AppTextStyles.font14WhiteMedium,
//           ),
//           DatePickerSpinner(
//             initialDate: initialToDate,
//             onDateSelected: onToDateSelected,
//           ),
//           SizedBox(height: 20.h),
//           AppButton(
//             buttonText: LKeys.save.tr,
//             textStyle: AppTextStyles.font14WhiteMedium,
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//           SizedBox(height: 20.h),
//         ],
//       ),
//     );
//   }
// }

// class DatePickerSpinner extends StatefulWidget {
//   final DateTime initialDate;
//   final ValueChanged<DateTime> onDateSelected;

//   const DatePickerSpinner({
//     super.key,
//     required this.initialDate,
//     required this.onDateSelected,
//   });

//   @override
//   _DatePickerSpinnerState createState() => _DatePickerSpinnerState();
// }

// class _DatePickerSpinnerState extends State<DatePickerSpinner> {
//   late DateTime _selectedDate;

//   @override
//   void initState() {
//     super.initState();
//     _selectedDate = widget.initialDate;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Expanded(
//               child: _buildPicker(
//                 value: _selectedDate.year,
//                 itemCount: DateTime.now().year - 1900 + 1,
//                 onSelectedItemChanged: (index) {
//                   HapticFeedback.lightImpact();
//                   setState(() {
//                     _selectedDate = DateTime(
//                       1900 + index,
//                       _selectedDate.month,
//                       _selectedDate.day,
//                     );
//                     widget.onDateSelected(_selectedDate);
//                   });
//                 },
//                 itemBuilder: (context, index) => _buildPickerItem('${1900 + index}'),
//               ),
//             ),
//             Expanded(
//               child: _buildPicker(
//                 value: _selectedDate.month,
//                 itemCount: 12,
//                 onSelectedItemChanged: (index) {
//                   HapticFeedback.lightImpact();
//                   setState(() {
//                     _selectedDate = DateTime(
//                       _selectedDate.year,
//                       index + 1,
//                       _selectedDate.day,
//                     );
//                     widget.onDateSelected(_selectedDate);
//                   });
//                 },
//                 itemBuilder: (context, index) => _buildPickerItem('${index + 1}'.padLeft(2, '0')),
//               ),
//             ),
//             Expanded(
//               child: _buildPicker(
//                 value: _selectedDate.day,
//                 itemCount: 31,
//                 onSelectedItemChanged: (index) {
//                   HapticFeedback.lightImpact();
//                   setState(() {
//                     _selectedDate = DateTime(
//                       _selectedDate.year,
//                       _selectedDate.month,
//                       index + 1,
//                     );
//                     widget.onDateSelected(_selectedDate);
//                   });
//                 },
//                 itemBuilder: (context, index) => _buildPickerItem('${index + 1}'.padLeft(2, '0')),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildPicker({
//     required int value,
//     required int itemCount,
//     required ValueChanged<int> onSelectedItemChanged,
//     required IndexedWidgetBuilder itemBuilder,
//   }) {
//     return SizedBox(
//       height: 150,
//       child: ListWheelScrollView.useDelegate(
//         controller: FixedExtentScrollController(initialItem: value - 1),
//         itemExtent: 50,
//          onSelectedItemChanged: (index) {
//           HapticFeedback.lightImpact(); 
//           onSelectedItemChanged(index);
//         },
//         physics: const FixedExtentScrollPhysics(),
//         childDelegate: ListWheelChildBuilderDelegate(
//           builder: itemBuilder,
//           childCount: itemCount,
//         ),
//       ),
//     );
//   }

//   Widget _buildPickerItem(String text) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         alignment: Alignment.center,
//         decoration: const BoxDecoration(
//           border: Border(
//             bottom: BorderSide(color: AppColors.primaryColor, width: 1.0),
//           ),
//         ),
//         child: Text(
//           text,
//           style: const TextStyle(color: Colors.white, fontSize: 20),
//         ),
//       ),
//     );
//   }
// }


// class CustomDateRangeTextField extends StatelessWidget {
//   final String fromLabel;
//   final String toLabel;
//   final String fromHintText;
//   final String toHintText;
//   final IconData? icon;
//   final TextEditingController fromController;
//   final TextEditingController toController;
//   final DateTime initialFromDate;
//   final DateTime initialToDate;
//   final void Function(DateTime) onFromDateSelected;
//   final void Function(DateTime) onToDateSelected;

//   const CustomDateRangeTextField({
//     super.key,
//     required this.fromLabel,
//     required this.toLabel,
//     required this.fromHintText,
//     required this.toHintText,
//     this.icon,
//     required this.fromController,
//     required this.toController,
//     required this.initialFromDate,
//     required this.initialToDate,
//     required this.onFromDateSelected,
//     required this.onToDateSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           fromLabel,
//           style: AppTextStyles.font16WhiteMedium,
//         ),
//         const SizedBox(height: 10),
//         TextFormField(
//           validator: (value) => ValidationHelper.emptyValidator(value),
//           controller: fromController,
//           readOnly: true,
//           onTap: () => _showDateRangeBottomSheet(context, true),
//           style: const TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//             hintText: fromHintText,
//             hintStyle: const TextStyle(color: Colors.grey),
//             filled: true,
//       fillColor:  CColors.cardBackgroundColorDark,
//             border: const OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.lightBlack, width: 2.0),
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             enabledBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.lightBlack, width: 2.0),
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             focusedBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             errorBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.red, width: 2.0),
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             focusedErrorBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.red, width: 2.0),
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             suffixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
//           ),
//         ),
//         const SizedBox(height: 20),
//         Text(
//           toLabel,
//           style: AppTextStyles.font16WhiteMedium,
//         ),
//         const SizedBox(height: 10),
//         TextFormField(
//           validator: (value) => ValidationHelper.emptyValidator(value),
//           controller: toController,
//           readOnly: true,
//           onTap: () => _showDateRangeBottomSheet(context, false),
//           style: const TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//             hintText: toHintText,
//             hintStyle: const TextStyle(color: Colors.grey),
//             filled: true,
//       fillColor:  CColors.cardBackgroundColorDark,
//             border: const OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.lightBlack, width: 2.0),
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             enabledBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.lightBlack, width: 2.0),
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             focusedBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             errorBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.red, width: 2.0),
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             focusedErrorBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.red, width: 2.0),
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             suffixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
//           ),
//         ),
//       ],
//     );
//   }

//   void _showDateRangeBottomSheet(BuildContext context, bool isFrom) {
//     showModalBottomSheet(
      
//       context: context,
//       builder: (BuildContext context) {
//         return CustomDateRangeBottomSheet(
//           initialFromDate: initialFromDate,
//           initialToDate: initialToDate,
//           onFromDateSelected: (date) {
//             if (isFrom) {
//               onFromDateSelected(date);
//               fromController.text = '${date.toLocal()}'.split(' ')[0];
//             } else {
//               onToDateSelected(date);
//               toController.text = '${date.toLocal()}'.split(' ')[0];
//             }
//           },
//           onToDateSelected: (date) {
//             if (!isFrom) {
//               onToDateSelected(date);
//               toController.text = '${date.toLocal()}'.split(' ')[0];
//             } else {
//               onFromDateSelected(date);
//               fromController.text = '${date.toLocal()}'.split(' ')[0];
//             }
//           },
//         );
//       },
//     );
//   }
// }
