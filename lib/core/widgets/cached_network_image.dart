import 'package:icar/config/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.radius,
    this.width,
    this.height,
    this.maxWidth,
    this.maxHeight,
    this.imageFit,
  });

  final String imageUrl;
  final double? radius;
  final double? width;
  final double? height;
  final double? maxWidth;
  final double? maxHeight;
  final BoxFit? imageFit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? ScreenUtil().setWidth(300),
      height: height,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? ScreenUtil().setWidth(300),
        maxHeight: maxHeight ?? ScreenUtil().setHeight(300),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0.0),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: imageFit ?? BoxFit.cover,
          placeholder: (ctx, url) => const CupertinoActivityIndicator(),
          errorWidget: (ctx, url, err) =>
              const Icon(CupertinoIcons.info, color: CColors.errorColorDark),
        ),
      ),
    );
  }
}
