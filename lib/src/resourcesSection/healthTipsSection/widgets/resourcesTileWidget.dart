import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/themes.dart';
import '../../../../res.dart';


class ResourcesTileWidget extends StatelessWidget {
  final String? text;
  final String? leadingImage;
  final VoidCallback? onTap;

  const ResourcesTileWidget({
    Key? key,
    this.text,
    this.leadingImage,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 70,
          child: Card(
            elevation: 4,
            color: AppColors.whitecolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        leadingImage!,
                        color: AppColors.appcolor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        text!,
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 17,
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    Res.arrowforward,
                    color: AppColors.lightdarktextcolor,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
