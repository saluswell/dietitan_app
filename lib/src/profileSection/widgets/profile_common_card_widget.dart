import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';

class MyAccountCardWidgets extends StatelessWidget {
  final String text;
  final String prefixicon;
  final String suffixicon;
  final VoidCallback ontap;
  final double height;
  final double width;

  MyAccountCardWidgets(
      {required this.text,
      required this.prefixicon,
      required this.suffixicon,
      required this.ontap,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: ontap,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    prefixicon,
                    height: height,
                    color: AppColors.appcolor,
                    width: width,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(text,
                      style: fontW5S12(context)!.copyWith(
                          // fontFamily: 'Gilroy',
                          color: AppColors.blackcolor,
                          // decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
                          fontSize: 12)),
                ],
              ),
              SvgPicture.asset(
                suffixicon,
                height: 12,
                width: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
