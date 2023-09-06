import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/appcolors.dart';

class CacheNetworkImageWidget extends StatefulWidget {
  final String imgUrl;
  final double? height;
  final double? width;
  final double radius;
  final double? builderHeight;
  final double? builerWidth;

  const CacheNetworkImageWidget(
      {Key? key,
      required this.imgUrl,
      this.height,
      this.width,
      required this.radius,
      this.builderHeight = 90,
      this.builerWidth = 120})
      : super(key: key);

  @override
  State<CacheNetworkImageWidget> createState() =>
      _CacheNetworkImageWidgetState();
}

class _CacheNetworkImageWidgetState extends State<CacheNetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        height: widget.height,
        width: widget.width,
        imageBuilder: (context, imageProvider) => Container(
              width: widget.builerWidth,
              height: widget.builderHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.radius),
                border: Border.all(width: 0, color: AppColors.orangecolor),
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.fitWidth),
              ),
            ),
        imageUrl: widget.imgUrl,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            // Placeholder(
            //   fallbackHeight: widget.builderHeight!,
            //   fallbackWidth: widget.builerWidth!,
            //   child: SvgPicture.asset(Res.placeHolder),
            // ),
            const SpinKitPouringHourGlass(
              color: AppColors.appcolor,
              size: 22,
              //    type: SpinKitWaveType.start
            ),
        errorWidget: (context, url, error) => const Icon(Icons.person));
  }
}
