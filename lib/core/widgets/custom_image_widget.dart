import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';


import 'dart:io'; // Import for handling File

class AppCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final double borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const AppCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.color,
    this.borderRadius = 0.0,
    this.placeholder,
    this.errorWidget,
  });

  Widget _buildPlaceholder() {
    if (placeholder != null) {
      return placeholder!;
    } else {
      return CustomShimmerWidget(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        borderRadius: borderRadius,
      );
    }
  }

  Widget _buildErrorWidget() {
    if (errorWidget != null) {
      return errorWidget!;
    } else {
      return const Icon(Icons.error, size: 40.0, color: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSvg = imageUrl.toLowerCase().endsWith('.svg');
    final isJson = imageUrl.toLowerCase().endsWith('.json');
    final isNetworkImage = imageUrl.startsWith('https');
    final isLocalFile = File(imageUrl).existsSync();

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Builder(
        builder: (context) {
          if (isSvg) {
            return SvgPicture.network(
              imageUrl,
              width: width,
              height: height,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
              fit: fit!,
              placeholderBuilder: (context) => _buildPlaceholder(),
            );
          } else if (isJson) {
            return Lottie.network(
              imageUrl,
              width: width,
              height: height,
              fit: fit!,
              frameBuilder: (context, child, composition) {
                if (composition == null) {
                  return _buildPlaceholder();
                } else {
                  return child;
                }
              },
              errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
            );
          } else if (isNetworkImage) {
            return CachedNetworkImage(
              imageUrl: imageUrl,
              width: width,
              height: height,
              fit: fit!,
              placeholder: (context, url) => _buildPlaceholder(),
              errorWidget: (context, url, error) => _buildErrorWidget(),
            );
          } else if (isLocalFile) {
            // Handle local file loading here
            return Image.file(
              File(imageUrl),
              width: width,
              height: height,
              fit: fit,
              color: color,
            );
          } else {
            // Fallback to asset loading if the image is in assets folder
            return Image.asset(
              imageUrl,
              width: width,
              height: height,
              fit: fit,
              color: color,
            );
          }
        },
      ),
    );
  }
}



class CustomShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const CustomShimmerWidget({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
