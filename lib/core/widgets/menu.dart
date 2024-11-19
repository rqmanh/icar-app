import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:icar/config/app_colors.dart';

class Menu extends StatelessWidget {
  final bool isFromPost;
  final List<PopupMenuItem> items;
  final Color? color;
  final bool isForVideo;
  final PopupMenuPosition? position;
  final Function(String)? onSelect;
  final Function(String)? handleOpen;

  const Menu(
      {super.key,
      this.isForVideo = true,
      required this.items,
      this.color,
      this.onSelect,
      this.handleOpen,
      this.position = PopupMenuPosition.over,
      this.isFromPost = false});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        onCanceled: () {
          if (handleOpen != null) {
            handleOpen!('cancel');
          }
        },
        onOpened: () {
          if (handleOpen != null) {
            handleOpen!('open');
          }
        },
        onSelected: (value) {
          if (onSelect != null) {
            onSelect!(value);
          }
        },
        elevation: 3,
        surfaceTintColor: Colors.white,
        position: position,
        shadowColor: CColors.iconColor.withOpacity(0.3),
        // padding: const EdgeInsets.all(20),
        color: CColors.cardBackgroundColorDark,
        // iconColor: color ?? CColors.iconColor,
        shape: const SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.all(
                SmoothRadius(cornerRadius: 8, cornerSmoothing: 1.0))),
        itemBuilder: (context) => items,
        child: isFromPost
            ? Icon(
                Icons.more_vert,
                color: color ??
                    (isForVideo
                        ? CColors.iconColor
                        : CColors.iconColor.withOpacity(0.3)),
              )
            : Icon(
                Icons.more_vert,
                color: color ??
                    (isForVideo
                        ? CColors.iconColor
                        : CColors.iconColor.withOpacity(0.3)),
              ));
  }
}

// //MenuItem
class MenuItem {
  final String title;
  final String value;

  MenuItem({required this.title, required this.value});
}

PopupMenuItem<dynamic> buildMenuItem(MenuItem item) {
  return PopupMenuItem(
    value: item.value,
    child: Text(item.title),
  );
}
