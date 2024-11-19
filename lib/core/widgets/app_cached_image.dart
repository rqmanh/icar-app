import 'package:icar/config/app_colors.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppCachedImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const AppCachedImage({super.key, this.imageUrl, this.fit,this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return imageUrl != null && imageUrl?.isNotEmpty == true
        ? CachedNetworkImage(
            cacheKey: imageUrl,
            imageUrl: imageUrl!,
            width: width,
            height: height,
            fit:fit?? BoxFit.cover,
            fadeInDuration: Duration.zero,
            fadeOutDuration: Duration.zero,
            
           errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholder: (context, url) {
              return placeHolder();
            },
          )
        : placeHolder();
  }

  Widget placeHolder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
      ),
    );
  }
}

class AppCachedProfileImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final String? fullName;
  final double? radius;

  const AppCachedProfileImage(
      {super.key, this.imageUrl, 
      this.radius,
      this.width, this.height, this.fullName});

  @override
  Widget build(BuildContext context) {
    return imageUrl != null && imageUrl?.isNotEmpty == true
        ? ClipRRect(
                borderRadius: BorderRadius.circular(radius??12),
          child: CachedNetworkImage(
              imageUrl: imageUrl!,
              width: width??50,
              height: height??50,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                return placeHolder();
              },
            ),
        )
        : placeHolder();
  }

  Widget placeHolder() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: width??50,
        height: height??50,
        color: CColors.black,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 2),
        child: Text((fullName ?? 'No')[0].toUpperCase(),
            style: CTextStyles.font32TealBold),
      ),
    );
  }
}
