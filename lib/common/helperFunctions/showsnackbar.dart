import 'package:flutter/material.dart';

import '../utils/appcolors.dart';
import '../utils/themes.dart';

dp({msg, arg}) => debugPrint("\n\x1B[32m $msg =$arg \n ");

pe({msg, arg}) => debugPrint(
      "\n\x1B[32m $msg =$arg \n ",
    );

showSnackBarMessage(
    {required BuildContext context,
    required String content,
    Color backgroundcolor = AppColors.appcolor,
    Color contentColor = AppColors.whitecolor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      backgroundColor: backgroundcolor,
      content: Text(
        content,
        style: fontW4S12(context)!.copyWith(color: contentColor),
        overflow: TextOverflow.visible,
      )));
}
