import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/utils/validator.dart';
import 'package:icar/core/widgets/buttons/primary_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            AppKeys.selectDate,
            style: const TextStyle(color: Colors.white, fontSize: 20),
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
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  _DatePickerSpinnerState createState() => _DatePickerSpinnerState();
}

class _DatePickerSpinnerState extends State<DatePickerSpinner> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _buildPicker(
                value: _selectedDate.year,
                itemCount: DateTime.now().year - 1900 + 1,
                onSelectedItemChanged: (index) {
                  HapticFeedback.lightImpact();
                  setState(() {
                    _selectedDate = DateTime(
                      1900 + index,
                      _selectedDate.month,
                      _selectedDate.day,
                    );
                    widget.onDateSelected(_selectedDate);
                  });
                },
                itemBuilder: (context, index) =>
                    _buildPickerItem('${1900 + index}'),
              ),
            ),
            Expanded(
              child: _buildPicker(
                value: _selectedDate.month,
                itemCount: 12,
                onSelectedItemChanged: (index) {
                  HapticFeedback.lightImpact();
                  setState(() {
                    _selectedDate = DateTime(
                      _selectedDate.year,
                      index + 1,
                      _selectedDate.day,
                    );
                    widget.onDateSelected(_selectedDate);
                  });
                },
                itemBuilder: (context, index) =>
                    _buildPickerItem('${index + 1}'.padLeft(2, '0')),
              ),
            ),
            Expanded(
              child: _buildPicker(
                value: _selectedDate.day,
                itemCount: 31,
                onSelectedItemChanged: (index) {
                  HapticFeedback.lightImpact();
                  setState(() {
                    _selectedDate = DateTime(
                      _selectedDate.year,
                      _selectedDate.month,
                      index + 1,
                    );
                    widget.onDateSelected(_selectedDate);
                  });
                },
                itemBuilder: (context, index) =>
                    _buildPickerItem('${index + 1}'.padLeft(2, '0')),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPicker({
    required int value,
    required int itemCount,
    required ValueChanged<int> onSelectedItemChanged,
    required IndexedWidgetBuilder itemBuilder,
  }) {
    return SizedBox(
      height: 150,
      child: ListWheelScrollView.useDelegate(
        controller: FixedExtentScrollController(initialItem: value - 1),
        itemExtent: 50,
        onSelectedItemChanged: (index) {
          HapticFeedback.lightImpact();
          onSelectedItemChanged(index);
        },
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: itemBuilder,
          childCount: itemCount,
        ),
      ),
    );
  }

  Widget _buildPickerItem(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: CColors.primaryColor, width: 1.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class CustomDateTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? icon;
  final TextEditingController controller;
  final DateTime initialDate;
  final void Function(DateTime) onDateSelected;

  const CustomDateTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.icon,
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
          style: CTextStyles.font16WhiteMedium,
        ),
        const SizedBox(height: 10),
        TextFormField(
          validator: (value) => ValidationHelper.emptyValidator(value),
          controller: controller,
          readOnly: true,
          onTap: () => _showDateBottomSheet(context),
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
      fillColor:  CColors.cardBackgroundColor,
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(10),
            //   borderSide: BorderSide.none,
            // ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: CColors.lightBlack, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: CColors.lightBlack, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: CColors.primaryColor, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),

            suffixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
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
