import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_icons.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/utils/validator.dart';
import 'package:icar/core/widgets/buttons/primary_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icar/core/widgets/svg_icon_widget.dart';

class CustomDateTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? icon;
  final String? iconPath;
  final TextEditingController controller;
  final DateTime initialDate;
  final void Function(DateTime) onDateSelected;

  const CustomDateTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.icon,
    this.iconPath,
    required this.controller,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: CTextStyles.font14BlackMedium,
        ),
        const SizedBox(height: 10),
        TextFormField(
          validator: (value) => ValidationHelper.emptyValidator(value),
          controller: controller,
          readOnly: true,
          onTap: () => _showDateBottomSheet(context),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: false,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: CColors.borderColor, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: CColors.borderColor, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: CColors.primaryColor, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            suffixIcon: iconPath != null
                ? SvgIconWidget(
                    path: iconPath ?? '',
                    color: CColors.transparent,
                  )
                : Icon(icon),
          ),
        ),
      ],
    );
  }

  void _showDateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: CColors.cardBackgroundColor,
      context: context,
      builder: (BuildContext context) {
        return CustomDateBottomSheet(
          initialDate: initialDate,
          onDateSelected: (date) {
            onDateSelected(date);
            controller.text = '${date.toLocal()}'.split(' ')[0];
          },
        );
      },
    );
  }
}

class CustomDateBottomSheet extends StatelessWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const CustomDateBottomSheet({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CColors.cardBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: CColors.borderColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            AppKeys.selectDate,
            style: CTextStyles.font18WhiteMedium.copyWith(color: CColors.black),
          ),
          SizedBox(height: 20.h),
          DatePickerSpinner(
            initialDate: initialDate,
            onDateSelected: onDateSelected,
          ),
          SizedBox(height: 20.h),
          AppButton(
            buttonText: AppKeys.save,
            textStyle: CTextStyles.font14WhiteMedium,
            onPressed: () => Navigator.of(context).pop(),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class DatePickerSpinner extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const DatePickerSpinner({
    Key? key,
    required this.initialDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  _DatePickerSpinnerState createState() => _DatePickerSpinnerState();
}

class _DatePickerSpinnerState extends State<DatePickerSpinner> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate.isBefore(DateTime.now())
        ? DateTime.now()
        : widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Year Picker
            Expanded(
              child: _buildPicker(
                value: _selectedDate.year,
                minValue: DateTime.now().year, // Start from this year
                maxValue: DateTime.now().year + 99, // 100 years ahead
                onChanged: (value) {
                  setState(() {
                    _selectedDate = DateTime(
                      value,
                      _selectedDate.month,
                      _selectedDate.day,
                    );
                    _adjustMonth();
                    widget.onDateSelected(_selectedDate);
                  });
                },
              ),
            ),
            // Month Picker
            Expanded(
              child: _buildPicker(
                value: _selectedDate.month,
                minValue: 1,
                maxValue: 12,
                onChanged: (value) {
                  setState(() {
                    _selectedDate = DateTime(
                      _selectedDate.year,
                      value,
                      _selectedDate.day,
                    );
                    _adjustDay();
                    widget.onDateSelected(_selectedDate);
                  });
                },
              ),
            ),
            // Day Picker
            Expanded(
              child: _buildPicker(
                value: _selectedDate.day,
                minValue: 1,
                maxValue: DateTime(
                  _selectedDate.year,
                  _selectedDate.month + 1,
                  0,
                ).day, // Last day of the month
                onChanged: (value) {
                  setState(() {
                    _selectedDate = DateTime(
                      _selectedDate.year,
                      _selectedDate.month,
                      value,
                    );
                    widget.onDateSelected(_selectedDate);
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPicker({
    required int value,
    required int minValue,
    required int maxValue,
    required ValueChanged<int> onChanged,
  }) {
    return Stack(
      children: [
        SizedBox(
          height: 150,
          child: ListWheelScrollView.useDelegate(
            controller:
                FixedExtentScrollController(initialItem: value - minValue),
            itemExtent: 50,
            onSelectedItemChanged: (index) => onChanged(minValue + index),
            physics: const FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                final text = (minValue + index).toString();
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                );
              },
              childCount: maxValue - minValue + 1,
            ),
          ),
        ),
        // Overlay for highlight lines
        Positioned.fill(
          child: Column(
            children: [
              // Line above
              const Spacer(),
              Container(height: 1, color: CColors.primaryColor),
              // Spacer for selected item
              const SizedBox(height: 48),
              // Line below
              Container(height: 1, color: CColors.primaryColor),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  void _adjustMonth() {
    final now = DateTime.now();
    if (_selectedDate.year == now.year && _selectedDate.month < now.month) {
      _selectedDate =
          DateTime(_selectedDate.year, now.month, _selectedDate.day);
    }
    _adjustDay();
  }

  void _adjustDay() {
    final lastDayOfMonth = DateTime(
      _selectedDate.year,
      _selectedDate.month + 1,
      0,
    ).day;
    if (_selectedDate.day > lastDayOfMonth) {
      _selectedDate = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        lastDayOfMonth,
      );
    }
  }
}
