import 'package:icar/config/app_colors.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final String? suffixText;
  final Widget? icon;
  final TextEditingController? controller;
  final bool? readOnly;
  final String? initialValue;
  final int? maxLines;
  final FocusNode? focusNode;
  final bool isNumber;
  final String? Function(String?)? onChanged;

  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.suffixText,
    this.focusNode,
    this.onChanged,
    this.maxLines,
    this.icon,
    this.isNumber = false,
    this.controller,
    this.readOnly,
    this.initialValue, // Accept initialValue as optional
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final textController = controller ?? TextEditingController();

    // Initialize with initial value if provided
    if (initialValue != null) {
      textController.text = initialValue!;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: CTextStyles.font14WhiteMedium),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          enabled:readOnly ,
          onChanged: onChanged,
          maxLines: maxLines,
          // textInputAction: maxLines == 1
          //     ? maxLines == null
          //         ? maxLines! > 1
          //             ? TextInputAction.newline
          //             : TextInputAction.next
          //         : TextInputAction.done
          //     : TextInputAction.newline,

          focusNode: focusNode,
          // initialValue: initialValue ?? controller!.text, // Use initialValue if provided, otherwise use controller.text
          validator: validator,
          readOnly: readOnly ?? false,
          
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            suffixText: suffixText,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor:  CColors.cardBackgroundColorDark,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
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
            suffixIcon: icon,
          ),
        ),
      ],
    );
  }
}
