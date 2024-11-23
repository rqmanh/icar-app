import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/utils/spacing.dart';
import 'package:icar/core/widgets/buttons/primary_button.dart';

import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class CustomMultiSelectDropdown extends StatelessWidget {
  final String label;
  final String hintText;
  final List<String> options;
  final void Function(List<String>) onSelected;
  final List<String> selectedOptions;
  final String? Function(String?)? validator;

  const CustomMultiSelectDropdown({
    super.key,
    required this.label,
    required this.hintText,
    required this.options,
    required this.onSelected,
    required this.selectedOptions,
    this.validator,
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
          validator: validator,
          readOnly: true,
          onTap: () => _showBottomSheet(context),
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: CColors.cardBackgroundColor,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
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
            suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          children: selectedOptions.map((option) {
            return Chip(
              label: Text(option, style: CTextStyles.font14WhiteMedium),
              deleteIcon: const Icon(Icons.cancel, color: Colors.white),
              onDeleted: () {
                final updatedOptions = List<String>.from(selectedOptions)
                  ..remove(option);
                onSelected(updatedOptions);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: CColors.cardBackgroundColor,
      context: context,
      builder: (context) {
        final selectedTemp = List<String>.from(selectedOptions);
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        label,
                        style: CTextStyles.font16WhiteSemiBold,
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: options.map((option) {
                          final isSelected = selectedTemp.contains(option);
                          return CheckboxListTile(
                            title: Text(option,
                                style: CTextStyles.font14WhiteMedium),
                            value: isSelected,
                            activeColor: CColors.primaryColor,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  selectedTemp.add(option);
                                } else {
                                  selectedTemp.remove(option);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      AppGesterDedector(
                        text: AppKeys.save,
                        onTap: () {
                          onSelected(selectedTemp);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

// class CustomDropdownField extends StatelessWidget {
//   final String label;
//   final String hintText;
//   final List<String> options;
//   final void Function(String) onSelected;
//   final TextEditingController? controller;
//   final bool enabled;

//   const CustomDropdownField({
//     super.key,
//     required this.label,
//     required this.hintText,
//     required this.options,
//     required this.onSelected,
//     this.controller,
//     this.enabled = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: CTextStyles.font16WhiteMedium,
//           textAlign: TextAlign.start,
//         ),
//         const SizedBox(height: 10),
//         TextFormField(
//           enabled: enabled,
//           validator: (value) =>
//               controller!.text.isEmpty ? AppKeys.requiredField : null,
//           controller: controller,
//           readOnly: true,
//           onTap: () => _showBottomSheet(context),
//           style: const TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: const TextStyle(color: Colors.grey),
//             filled: true,
//             fillColor: CColors.cardBackgroundColorDark,
//             border: const OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey, width: 1.0),
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             enabledBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: CColors.lightBlack, width: 2.0),
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             focusedBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: CColors.primaryColor, width: 2.0),
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
//             suffixIcon: const Icon(Iconsax.arrow_down_1, color: Colors.grey),
//           ),
//         ),
//       ],
//     );
//   }

//   void _showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       backgroundColor: CColors.cardBackgroundColorDark,
//       context: context,
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.all(20.0),
//           // height: MediaQuery.of(context).size.height / options.length - 200,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 label,
//                 style: CTextStyles.font16WhiteSemiBold,
//               ),
//               SizedBox(height: 20.h),
//               Flexible(
//                 child: ListView.builder(
//                   itemCount: options.length,
//                   itemBuilder: (context, index) {
//                     final option = options[index];
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: option == hintText
//                                 ? CColors.primaryColor
//                                 : Colors.grey,
//                             width: 1,
//                           ),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: ListTile(
//                           leading: Icon(
//                             Icons.circle,
//                             color: option == hintText
//                                 ? CColors.primaryColor
//                                 : Colors.grey,
//                           ),
//                           title: Text(
//                             option,
//                             style: CTextStyles.font16WhiteSemiBold,
//                           ),
//                           onTap: () {
//                             onSelected(option);
//                             controller!.text = option;
//                             Navigator.pop(context);
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

class CustomDropdownField extends StatelessWidget {
  final String label;
  final String hintText;
  final List<String> options;
  final void Function(String) onSelected;
  final TextEditingController? controller;
  final bool enabled;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.hintText,
    required this.options,
    required this.onSelected,
    this.controller,
    this.enabled = true,
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
          enabled: enabled,
          validator: (value) {
            if (controller == null || controller!.text.isEmpty) {
              return AppKeys.requiredField;
            }
            return null;
          },
          controller: controller,
          readOnly: true,
          onTap: enabled ? () => _showBottomSheet(context) : null,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: false,
            fillColor: CColors.cardBackgroundColor,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: CColors.borderColor, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: CColors.borderColor, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: CColors.primaryColor, width: 1.0),
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
            suffixIcon: const Icon(Iconsax.arrow_down_1, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: CColors.backgroundColor,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                    color: CColors.borderColor,
                    borderRadius: BorderRadius.circular(12)),
              ),
              verticalSpace(10),
              Text(
                label,
                style: CTextStyles.font16DarkSemiBold,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: options.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final option = options[index];
                    final isSelected = option == controller?.text;
                    return ListTile(
                      splashColor: CColors.transparent,
                      leading: Radio<String>(
                        value: option,
                        groupValue: controller?.text,
                        onChanged: (value) {
                          if (value != null) {
                            onSelected(value);
                            if (controller != null) {
                              controller!.text = value;
                            }
                            Navigator.pop(context);
                          }
                        },
                        activeColor: CColors.primaryColor,
                      ),
                      title: Text(
                        option,
                        style: CTextStyles.font16BlackMedium,
                      ),
                      tileColor: isSelected
                          ? CColors.primaryColor.withOpacity(0.1)
                          : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: isSelected
                              ? CColors.primaryColor
                              : CColors.borderColor.withOpacity(0.5),
                          width: 1.0, // Border width
                        ),
                      ),
                      onTap: () {
                        onSelected(option);
                        if (controller != null) {
                          controller!.text = option;
                        }
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
