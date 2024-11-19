

import 'dart:io';

import 'package:icar/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icar/core/utils/app_utils.dart';

import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CustomAvatarImageWidget extends StatelessWidget {
  final String image;
  final double radius;
  final BoxFit? fit;
  final Color? color;
  final String? placeholderImage;

  const CustomAvatarImageWidget(
    this.image, {
    super.key,
    this.radius = 50.0,
    this.fit = BoxFit.cover,
    this.color,
    this.placeholderImage,
  });

  @override
  Widget build(BuildContext context) {
    final isSvg = image.toLowerCase().endsWith('.svg');
    final isJson = image.toLowerCase().endsWith('.json');
    final isNetworkImage = image.startsWith('http');
    final isAssetImage = !isSvg && !isJson && !isNetworkImage;

    Widget buildPlaceholder() {
      if (placeholderImage != null) {
        if (placeholderImage!.toLowerCase().endsWith('.svg')) {
          return SvgPicture.asset(
            placeholderImage!,
            width: radius * 2,
            height: radius * 2,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
            fit: fit!,
          );
        } else if (placeholderImage!.toLowerCase().endsWith('.json')) {
          return Lottie.asset(
            placeholderImage!,
            width: radius * 2,
            height: radius * 2,
            fit: fit!,
          );
        } else if (placeholderImage!.toLowerCase().startsWith('http')) {
          return CachedNetworkImage(
            imageUrl: placeholderImage!,
            width: radius * 2,
            height: radius * 2,
            fit: fit!,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
              ),
            ),
            errorWidget: (context, url, error) => const CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.grey,
              child: Icon(Icons.error),
            ),
          );
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              placeholderImage!,
              width: radius * 2,
              height: radius * 2,
              fit: fit,
              color: color,
            ),
          );
        }
      } else {
        return CircleAvatar(
          radius: radius,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            ),
          ),
        );
      }
    }

    return ClipOval(
      child: Container(
        width: radius * 2,
        height: radius * 2,
        color: color ?? Colors.grey[200], // Placeholder background color
        child: Builder(
          builder: (context) {
            if (isSvg) {
              return SvgPicture.network(
                image,
                width: radius * 2,
                height: radius * 2,
                colorFilter: color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null,
                fit: fit!,
                placeholderBuilder: (BuildContext context) =>
                    buildPlaceholder(),
              );
            } else if (isJson) {
              return Lottie.network(
                image,
                width: radius * 2,
                height: radius * 2,
                fit: fit!,
                onLoaded: (composition) {
                  // do nothing, as Lottie.network doesn't provide a placeholder
                },
                // onError: (error) => _buildPlaceholder(),
              );
            } else if (isNetworkImage) {
              return CachedNetworkImage(
                imageUrl: image,
                width: radius * 2,
                height: radius * 2,
                fit: fit!,
                placeholder: (context, url) => buildPlaceholder(),
                errorWidget: (context, url, error) => const CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.error),
                ),
              );
            } else if (isAssetImage) {
              return Image.asset(
                image,
                width: radius * 2,
                height: radius * 2,
                fit: fit,
                color: color,
              );
            } else {
              return const CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.grey,
                child: Icon(Icons.error),
              );
            }
          },
        ),
      ),
    );
  }
}

class CustomAvatarImageWidgetWithRemoveIcon extends StatelessWidget {
  final String image;
  final double radius;
  final BoxFit? fit;
  final Color? color;
  final String? placeholderImage;
  final VoidCallback? onRemove;
  final bool isOwner;

  const CustomAvatarImageWidgetWithRemoveIcon(
    this.image, {
    super.key,
    this.radius = 50.0,
    this.fit = BoxFit.cover,
    this.color,
    this.placeholderImage,
    this.onRemove,
    this.isOwner = false,
  });

  @override
  Widget build(BuildContext context) {
    final isSvg = image.toLowerCase().endsWith('.svg');
    final isJson = image.toLowerCase().endsWith('.json');
    final isNetworkImage = image.startsWith('https');
    final isAssetImage = !isSvg && !isJson && !isNetworkImage;

    Widget buildPlaceholder() {
      if (placeholderImage != null) {
        if (placeholderImage!.toLowerCase().endsWith('.svg')) {
          return SvgPicture.asset(
            placeholderImage!,
            width: radius * 2,
            height: radius * 2,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
            fit: fit!,
          );
        } else if (placeholderImage!.toLowerCase().endsWith('.json')) {
          return Lottie.asset(
            placeholderImage!,
            width: radius * 2,
            height: radius * 2,
            fit: fit!,
          );
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              placeholderImage!,
              width: radius * 2,
              height: radius * 2,
              fit: fit,
              color: color,
            ),
          );
        }
      } else {
        return CircleAvatar(
          radius: radius,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            ),
          ),
        );
      }
    }

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: radius * 2,
            height: radius * 2,
            color: color ?? Colors.grey[200], // Placeholder background color
            child: Builder(
              builder: (context) {
                if (isSvg) {
                  return SvgPicture.network(
                    image,
                    width: radius * 2,
                    height: radius * 2,
                    colorFilter: color != null
                        ? ColorFilter.mode(color!, BlendMode.srcIn)
                        : null,
                    fit: fit!,
                    placeholderBuilder: (BuildContext context) =>
                        buildPlaceholder(),
                  );
                } else if (isJson) {
                  return Lottie.network(
                    image,
                    width: radius * 2,
                    height: radius * 2,
                    fit: fit!,
                  );
                } else if (isNetworkImage) {
                  return CachedNetworkImage(
                    imageUrl: image,
                    width: radius * 2,
                    height: radius * 2,
                    fit: fit!,
                    placeholder: (context, url) => buildPlaceholder(),
                    errorWidget: (context, url, error) => const CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.error),
                    ),
                  );
                } else if (isAssetImage) {
                  return Image.asset(
                    image,
                    width: radius * 2,
                    height: radius * 2,
                    fit: fit,
                    color: color,
                  );
                } else {
                  return const CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.error),
                  );
                }
              },
            ),
          ),
        ),
        if (isOwner)
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                padding: const EdgeInsets.all(4),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: radius * 0.4,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class CustomAssetImageWidget extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;

  const CustomAssetImageWidget(
    this.image, {
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isSvg = image.toLowerCase().endsWith('.svg');
    final isJson = image.toLowerCase().endsWith('.json');
    final isNetworkImage = image.startsWith('https');

    if (isSvg) {
      return SvgPicture.asset(
        image,
        width: width,
        height: height,
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        fit: fit!,
      );
    } else if (isJson) {
      return Lottie.asset(
        image,
        width: width,
        height: height,
        fit: fit!,
      );
    } else if (isNetworkImage) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: image,
          width: width,
          height: height,
          fit: fit!,
          // placeholder: (context, url) {
          // reutrn a placeholder widget
          // return
          // SvgPicture.asset(
          //  AppImages.imagesPlaceHolder,
          //   width: 100,
          //   height: 100,
          //   fit: BoxFit.cover,
          // );
          // },
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            ),
          ),
          errorWidget: (context, url, error) {
            // return an error widget
            return const Center(
              child: Icon(Icons.image_not_supported),
            );
          },
        ),
      );
    } else {
      return Image.asset(
        image,
        width: width,
        height: height,
        fit: fit,
        color: color,
      );
    }
  }
}



class CircleEditableImageWidget extends StatelessWidget {
  final String imagePath;
  final String imageIcon;
  final void Function() onClick;
  final void Function()? onRemove;

  CircleEditableImageWidget({
    required this.imagePath,
    required this.imageIcon,
    required this.onClick,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (imagePath.isEmpty) {
      // If no image is provided, show a placeholder with the icon
      imageWidget = CircleAvatar(
        backgroundColor: CColors.backgroundColorDark,
        radius:  AppUtils.getScreenWidth(context) * 0.15,
        child: imageIcon.endsWith('.svg')
            ? SvgPicture.asset(
                imageIcon,
                width:  AppUtils.getScreenWidth(context) * 0.15,
                colorFilter: const ColorFilter.mode(
                  CColors.primaryColor,
                  BlendMode.srcIn,
                ),
              )
            : Image.asset(
                imageIcon,
                width: AppUtils.getScreenWidth(context) * 0.15,
                height:  AppUtils.getScreenHeight(context) * 0.15,
                fit: BoxFit.cover,
                color: CColors.primaryColor,
              ),
      );
    } else if (imagePath.startsWith('https')) {
      // If the imagePath is a network URL
      imageWidget = CircleAvatar(
        backgroundColor: CColors.backgroundColorDark,
        radius:  AppUtils.getScreenWidth(context) * 0.15,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: imagePath,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      );
    } else if (File(imagePath).existsSync()) {
      // If the imagePath is a local file path (selected from the device)
      imageWidget = CircleAvatar(
        backgroundColor: CColors.backgroundColorDark,
        radius:  AppUtils.getScreenWidth(context) * 0.15,
        backgroundImage: FileImage(File(imagePath)), // Use FileImage for local files
      );
    } else {
      // If the imagePath is an invalid path, fallback to a placeholder
      imageWidget = CircleAvatar(
        backgroundColor: CColors.backgroundColorDark,
        radius:  AppUtils.getScreenWidth(context) * 0.15,
        child: const Icon(Icons.image_not_supported), // Fallback if the file does not exist
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        GestureDetector(onTap: onClick, child: imageWidget),
        // Positioned(
        //   bottom: 10,
        //   child: imagePath.isEmpty
        //       ? Card(
        //           color: Get.theme.inputDecorationTheme.fillColor,
        //           shape: const CircleBorder(),
        //           child: const Padding(
        //             padding: EdgeInsets.all(6.0),
        //             child: Icon(Icons.add_a_photo_rounded),
        //           ),
        //         )
        //       : const SizedBox.shrink(),
        // ),
        if (imagePath.isNotEmpty && onRemove != null)
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: onRemove,
              child: const CircleAvatar(
                backgroundColor: Colors.red,
                radius: 15,
                child: Icon(
                  Iconsax.pen_remove,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
