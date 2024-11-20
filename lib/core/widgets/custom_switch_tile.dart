import 'package:icar/config/app_colors.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitchTile extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitchTile({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0.h,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color:  CColors.cardBackgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: CColors.lightBlack, width: 2.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: CTextStyles.font16WhiteMedium,
          ),
          Switch.adaptive(
            
            value: value,
            onChanged: onChanged,
            activeColor: CColors.primaryColor,
            // inactiveThumbColor: Colors.grey,
            // inactiveTrackColor: Colors.grey[700],
          ),
        ],
      ),
    );
  }
}
