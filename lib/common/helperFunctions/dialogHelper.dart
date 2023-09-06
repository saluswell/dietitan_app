import 'package:flutter/material.dart';
import 'package:saluswell_dietitan_app_updated/common/helperFunctions/navigatorHelper.dart';
import 'package:saluswell_dietitan_app_updated/common/utils/appcolors.dart';

class DialogHelper {
  static showBottomSheet({required Widget widget}) {
    showModalBottomSheet(
      backgroundColor: AppColors.whitecolor,
      context: navstate.currentState!.context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17), topRight: Radius.circular(17))),
      builder: (BuildContext context) {
        return widget;
      },
    );
  }
}
