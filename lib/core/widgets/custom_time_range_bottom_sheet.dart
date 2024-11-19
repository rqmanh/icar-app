// import 'package:icar/config/app_colors.dart';
// import 'package:icar/config/theme/app_text_styles.dart';
// import 'package:icar/core/localization/local_keys.dart';
// import 'package:icar/core/widgets/buttons/primary_button.dart';
// import 'package:icar/utils/validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class CustomTimeRangeBottomSheet extends StatelessWidget {
//   final TimeOfDay initialFromTime;
//   final TimeOfDay initialToTime;
//   final ValueChanged<TimeOfDay> onFromTimeSelected;
//   final ValueChanged<TimeOfDay> onToTimeSelected;

//   const CustomTimeRangeBottomSheet({
//     super.key,
//     required this.initialFromTime,
//     required this.initialToTime,
//     required this.onFromTimeSelected,
//     required this.onToTimeSelected,
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
//             'اختر الوقت',
//             style: AppTextStyles.font16WhiteBold,
//           ),
//           SizedBox(height: 20.h),
//           Text(
//             'من',
//             style: AppTextStyles.font14WhiteMedium,
//           ),
//           TimePickerSpinner(
//             initialTime: initialFromTime,
//             onTimeSelected: onFromTimeSelected,
//           ),
//           SizedBox(height: 20.h),
//           Text(
//             'إلى',
//             style: AppTextStyles.font14WhiteMedium,
//           ),
//           TimePickerSpinner(
//             initialTime: initialToTime,
//             onTimeSelected: onToTimeSelected,
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

// class TimePickerSpinner extends StatefulWidget {
//   final TimeOfDay initialTime;
//   final ValueChanged<TimeOfDay> onTimeSelected;

//   const TimePickerSpinner({
//     super.key,
//     required this.initialTime,
//     required this.onTimeSelected,
//   });

//   @override
//   _TimePickerSpinnerState createState() => _TimePickerSpinnerState();
// }

// class _TimePickerSpinnerState extends State<TimePickerSpinner> {
//   late TimeOfDay _selectedTime;
//   bool _isAm = true;

//   @override
//   void initState() {
//     super.initState();
//     _selectedTime = widget.initialTime;
//     _isAm = _selectedTime.period == DayPeriod.am;
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
//                 value: _selectedTime.hourOfPeriod,
//                 itemCount: 12,
//                 onSelectedItemChanged: (index) {
//                   HapticFeedback.lightImpact();
//                   setState(() {
//                     int hour = _isAm ? index % 12 : (index % 12) + 12;
//                     _selectedTime = TimeOfDay(hour: hour, minute: _selectedTime.minute);
//                     widget.onTimeSelected(_selectedTime);
//                   });
//                 },
//                 itemBuilder: (context, index) => _buildPickerItem('${index == 0 ? 12 : index}'),
//               ),
//             ),
//             Expanded(
//               child: _buildPicker(
//                 value: _selectedTime.minute,
//                 itemCount: 60,
//                 onSelectedItemChanged: (index) {
//                   HapticFeedback.lightImpact();
//                   setState(() {
//                     _selectedTime = TimeOfDay(hour: _selectedTime.hour, minute: index);
//                     widget.onTimeSelected(_selectedTime);
//                   });
//                 },
//                 itemBuilder: (context, index) => _buildPickerItem('${index.toString().padLeft(2, '0')}'),
//               ),
//             ),
//             Expanded(
//               child: _buildPicker(
//                 value: _isAm ? 0 : 1,
//                 itemCount: 2,
//                 onSelectedItemChanged: (index) {
//                   HapticFeedback.lightImpact();
//                   setState(() {
//                     _isAm = index == 0;
//                     int hour = _isAm ? _selectedTime.hour % 12 : (_selectedTime.hour % 12) + 12;
//                     _selectedTime = TimeOfDay(hour: hour, minute: _selectedTime.minute);
//                     widget.onTimeSelected(_selectedTime);
//                   });
//                 },
//                 itemBuilder: (context, index) => _buildPickerItem(index == 0 ? 'AM' : 'PM'),
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
//         controller: FixedExtentScrollController(initialItem: value),
//         itemExtent: 50,
//         onSelectedItemChanged: (index) {
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

// class CustomTimeRangeTextField extends StatelessWidget {
//   final String fromLabel;
//   final String toLabel;
//   final String fromHintText;
//   final String toHintText;
//   final IconData? icon;
//   final TextEditingController fromController;
//   final TextEditingController toController;
//   final TimeOfDay initialFromTime;
//   final TimeOfDay initialToTime;
//   final void Function(TimeOfDay) onFromTimeSelected;
//   final void Function(TimeOfDay) onToTimeSelected;

//   const CustomTimeRangeTextField({
//     super.key,
//     required this.fromLabel,
//     required this.toLabel,
//     required this.fromHintText,
//     required this.toHintText,
//     this.icon,
//     required this.fromController,
//     required this.toController,
//     required this.initialFromTime,
//     required this.initialToTime,
//     required this.onFromTimeSelected,
//     required this.onToTimeSelected,
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
//         Row(
//           children: [
//             Expanded(
//               child: TextFormField(
//                 validator: (value) => ValidationHelper.emptyValidator(value),
//                 controller: fromController,
//                 readOnly: true,
//                 onTap: () => _showTimeRangeBottomSheet(context, true),
//                 style: const TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: fromHintText,
//                   hintStyle: const TextStyle(color: Colors.grey),
//                   filled: true,
//             fillColor:  CColors.cardBackgroundColorDark,
//                   border: const OutlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.lightBlack, width: 2.0),
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                   ),
//                   enabledBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.lightBlack, width: 2.0),
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                   ),
//                   focusedBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                   ),
//                   errorBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red, width: 2.0),
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                   ),
//                   focusedErrorBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red, width: 2.0),
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                   ),
//                   suffixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 20),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     toLabel,
//                     style: AppTextStyles.font16WhiteMedium,
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     validator: (value) => ValidationHelper.emptyValidator(value),
//                     controller: toController,
//                     readOnly: true,
//                     onTap: () => _showTimeRangeBottomSheet(context, false),
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       hintText: toHintText,
//                       hintStyle: const TextStyle(color: Colors.grey),
//                       filled: true,
//                 fillColor:  CColors.cardBackgroundColorDark,
//                       border: const OutlineInputBorder(
//                         borderSide: BorderSide(color: AppColors.lightBlack, width: 2.0),
//                         borderRadius: BorderRadius.all(Radius.circular(15)),
//                       ),
//                       enabledBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: AppColors.lightBlack, width: 2.0),
//                         borderRadius: BorderRadius.all(Radius.circular(15)),
//                       ),
//                       focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
//                         borderRadius: BorderRadius.all(Radius.circular(15)),
//                       ),
//                       errorBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red, width: 2.0),
//                         borderRadius: BorderRadius.all(Radius.circular(15)),
//                       ),
//                       focusedErrorBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red, width: 2.0),
//                         borderRadius: BorderRadius.all(Radius.circular(15)),
//                       ),
//                       suffixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   void _showTimeRangeBottomSheet(BuildContext context, bool isFrom) {
//     showModalBottomSheet(
      
//       context: context,
//       builder: (BuildContext context) {
//         return CustomTimeRangeBottomSheet(
//           initialFromTime: initialFromTime,
//           initialToTime: initialToTime,
//           onFromTimeSelected: (time) {
//             if (isFrom) {
//               onFromTimeSelected(time);
//               fromController.text = time.format(context);
//             } else {
//               onToTimeSelected(time);
//               toController.text = time.format(context);
//             }
//           },
//           onToTimeSelected: (time) {
//             if (!isFrom) {
//               onToTimeSelected(time);
//               toController.text = time.format(context);
//             } else {
//               onFromTimeSelected(time);
//               fromController.text = time.format(context);
//             }
//           },
//         );
//       },
//     );
//   }
// }
