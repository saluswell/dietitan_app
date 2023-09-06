import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../../res.dart';
import '../../../common/utils/appcolors.dart';
import '../provider/bottom_navbar_provider.dart';

class BottomNavScreen extends StatefulWidget {
  static const String routeName = "BottomNavScreen";

  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(builder: (context, provider, __) {
      return WillPopScope(
        onWillPop: () async {
          if (provider.currentIndex != 0) {
            provider.updateCurrentScreen(0);
            return false;
          }
          if (provider.currentIndex == 0) {
            return true;
          }
          return false;
        },
        child: Scaffold(
          body: Consumer<BottomNavProvider>(
            builder: (context, provider, child) {
              return provider.currentScreen;
            },
          ),
          bottomNavigationBar:
              Consumer<BottomNavProvider>(builder: (context, provider, child) {
            return BottomNavigationBar(
                elevation: 0.0,
                currentIndex: provider.currentIndex,
                backgroundColor: AppColors.appcolor,
                onTap: (index) {
                  provider.updateCurrentScreen(index);
                },
                type: BottomNavigationBarType.fixed,
                items: [
                  bottomNavItem(
                      path: Res.homebottomwhite,
                      selectedColor: provider.currentIndex == 0
                          ? AppColors.whitecolor
                          : AppColors.whitecolor.withOpacity(0.5)),
                  bottomNavItem(
                      path: Res.calendarbottomwhite,
                      height: 21,
                      width: 21,
                      selectedColor: provider.currentIndex == 1
                          ? AppColors.whitecolor
                          : AppColors.whitecolor.withOpacity(0.5)),
                  bottomNavItem(
                      path: Res.resourcesbottomwhite,
                      selectedColor: provider.currentIndex == 2
                          ? AppColors.whitecolor
                          : AppColors.whitecolor.withOpacity(0.5)),
                  bottomNavItem(
                      path: Res.chatbottonwhite,
                      selectedColor: provider.currentIndex == 3
                          ? AppColors.whitecolor
                          : AppColors.whitecolor.withOpacity(0.5)),
                  bottomNavItem(
                      path: Res.personbottomwhite,
                      selectedColor: provider.currentIndex == 4
                          ? AppColors.whitecolor
                          : AppColors.whitecolor.withOpacity(0.5)),
                ]);
          }),
        ),
      );
    });
  }

  bottomNavItem({
    double? height,
    double? width,
    required Color selectedColor,
    required String path,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        path,
        height: height,
        width: width,
        color: selectedColor,
      ),
      label: '',
    );
  }
}
