import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/helperFunctions/hive_local_storage.dart';
import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/helperFunctions/showsnackbar.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/textutils.dart';
import '../../../common/utils/themes.dart';
import '../../../res.dart';
import '../../dashboardsection/screens/bottomNavScreen.dart';
import '../../onboardingsection/screens/onboardingscreen_one.dart';
import '../providers/savUserDetailsProvider.dart';
import '../services/authServices.dart';
import '../services/userServices.dart';
import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthServices authServices = AuthServices();

  void initState() {
    checkLogin();
    super.initState();
  }

  Future<void> checkLogin() async {
    User? user = authServices.getCurrentUser();

    // UserModel userModel =
    //     (await userService.fetchUserRecord(user!.uid)) as UserModel;

    dp(msg: "User", arg: user.toString());

    String currentRoute = await HiveLocalStorage.readHiveValue<String>(
          boxName: TextUtils.currentRouteBox,
          key: TextUtils.currentRouteKey,
        ) ??
        '';

    dp(msg: "Current route", arg: currentRoute);
    Timer(const Duration(seconds: 3), () async {
      if (user != null) {
        UserServices.userId = user.uid;
        UserServices.tempUser = await authServices.fetchCurrentUser();
        //  print(UserServices.tempUser?.toJson('docID'));
        dp(
            arg: UserServices.tempUser!.toJson(UserServices.userId.toString()),
            msg: "tempuserModelongooglesigning");

        Provider.of<UserProvider>(context, listen: false)
            .saveUserDetails(UserServices.tempUser);
        // UserService.userId = user.phoneNumber;
        // UserService.tempUser = await userService.fetchCurrentUser();
        // StorageService().uploadUserDocs();
        //dp(msg: "User Phone Id", arg: UserService.userId);
        if (currentRoute == OnBoardingScreenOne.routeName) {
          toRemoveAll(context: context, widget: LoginScreen());
        } else if (currentRoute == LoginScreen.routeName) {
          toRemoveAll(context: context, widget: BottomNavScreen());
        } else {
          toRemoveAll(context: context, widget: OnBoardingScreenOne());
        }
      } else if (currentRoute == OnBoardingScreenOne.routeName) {
        toRemoveAll(context: context, widget: LoginScreen());
      } else {
        toRemoveAll(context: context, widget: OnBoardingScreenOne());
      }
    });
  }

  // @override
  // void initState() {
  //   Future.delayed(const Duration(seconds: 3)).then((value) {
  //     toRemoveAll(context: context, widget: OnBoardingScreenOne());
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset(
                  Res.applogoupdated,
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Dietitian",
                  style: fontW5S12(context)!.copyWith(
                      fontSize: 24,
                      color: AppColors.appcolor,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
