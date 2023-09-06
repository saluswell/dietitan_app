import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/src/recipesSection/screens/reccipes_list_screen.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/cacheNetworkImageWidget.dart';
import '../../../res.dart';
import '../../authenticationsection/Models/userModel.dart';
import '../../authenticationsection/providers/authProvider.dart';
import '../../authenticationsection/services/userServices.dart';
import '../../notificationSection/screens/notificationListScreen.dart';
import '../help_center.dart';
import '../privacy_policy.dart';
import '../terms_and_conditions.dart';
import '../widgets/account_header_divider.dart';
import '../widgets/profile_common_card_widget.dart';
import 'editProfileScreen.dart';
import 'myProfileTab/aboutTab.dart';
import 'myProfileTab/reviewsTab.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen(
      {Key? key,
      menuScreenContext,
      bool? hideStatus,
      Null Function()? onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  UserServices userServices = UserServices();

  //final user =FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, __) {
      return Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: Colors.white.withOpacity(0.1),
            elevation: 0,
            leading: Text(""),
            centerTitle: true,
            title: Text("My Account",
                style: fontW5S12(context)!.copyWith(
                    color: AppColors.blackcolor,
                    fontWeight: FontWeight.w600,
                    fontSize: 19)),
          ),
          body: StreamProvider.value(
              value: userServices
                  .fetchUserRecord(FirebaseAuth.instance.currentUser!.uid),
              initialData: UserModel(),
              builder: (context, child) {
                UserModel model = context.watch<UserModel>();
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      AccountHeadingDividerWidget(
                        text: "Profile",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                model.profilePicture == null
                                    ? Container(
                                        height: 50,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    Res.articelsImagepng)),
                                            borderRadius:
                                                BorderRadius.circular(13)),
                                      )
                                    : CacheNetworkImageWidget(
                                        height: 50,
                                        width: 60,
                                        imgUrl: model.profilePicture.toString(),
                                        radius: 7,
                                      ),
                                // InkWell(
                                //   child: Container(
                                //     height: 60,
                                //     width: 55,
                                //     child: Image.asset(Res.articelsImagepng),
                                //   ),
                                //   onTap: () {
                                //     toNext(
                                //         context: context,
                                //         widget: MyProfileScreen());
                                //   },
                                // ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(model.userName ?? "",
                                        style: TextStyle(
                                            // fontFamily: 'Gilroy',
                                            color: AppColors.blackcolor,
                                            // decoration: TextDecoration.underline,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Axiforma',
                                            fontSize: 13)),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(model.emailAdress ?? "",
                                        style: TextStyle(
                                            // fontFamily: 'Gilroy',
                                            color: AppColors.lightdarktextcolor
                                                .withOpacity(0.9),
                                            // decoration: TextDecoration.underline,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Axiforma',
                                            fontSize: 11)),
                                  ],
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                toNext(
                                    context: context,
                                    widget: EditProfileScreen(
                                      userId: model.userId.toString(),
                                      userName: model.userName.toString(),
                                      userEmail: model.emailAdress.toString(),
                                      firebaseimage:
                                          model.profilePicture.toString(),
                                    ));
                              },
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                    color: AppColors.appcolor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    Res.editicon,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AccountHeadingDividerWidget(
                        text: "Settings",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyAccountCardWidgets(
                        height: 25,
                        width: 22,
                        text: "My Profile",
                        prefixicon: Res.user,
                        suffixicon: Res.arrowforward,
                        ontap: () {
                          toNext(
                              context: context,
                              widget: AboutUserProfileTabScreen(
                                userModel: model,
                              ));
                        },
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Divider(
                        color: AppColors.lightdarktextcolor.withOpacity(0.7),
                      ),
                      // const SizedBox(
                      //   height: 6,
                      // ),
                      // MyAccountCardWidgets(
                      //   height: 22,
                      //   width: 22,
                      //   text: "Language",
                      //   prefixicon: Res.languageIcon,
                      //   suffixicon: Res.arrowforward,
                      //   ontap: () {},
                      // ),
                      // const SizedBox(
                      //   height: 6,
                      // ),
                      // Divider(
                      //   color: AppColors.lightdarktextcolor.withOpacity(0.7),
                      // ),
                      const SizedBox(
                        height: 6,
                      ),
                      MyAccountCardWidgets(
                        height: 23,
                        width: 23,
                        text: "Notifications",
                        prefixicon: Res.notificationsIconsvg,
                        suffixicon: Res.arrowforward,
                        ontap: () {
                          toNext(
                              context: context,
                              widget: NotificaionsListScreen());
                          // pushNewScreen(context,
                          //     withNavBar: true, screen: NotificationsScreen());
                        },
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Divider(
                        color: AppColors.lightdarktextcolor.withOpacity(0.7),
                      ),

                      const SizedBox(
                        height: 6,
                      ),
                      MyAccountCardWidgets(
                        height: 23,
                        width: 23,
                        text: "My Reviews",
                        prefixicon: Res.reviewIcon,
                        suffixicon: Res.arrowforward,
                        ontap: () {
                          toNext(
                              context: context, widget: ReviewListTabScreen());
                          // pushNewScreen(context,
                          //     withNavBar: true, screen: NotificationsScreen());
                        },
                      ),

                      const SizedBox(
                        height: 6,
                      ),
                      Divider(
                        color: AppColors.lightdarktextcolor.withOpacity(0.7),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      MyAccountCardWidgets(
                        height: 22,
                        width: 22,
                        text: "Invite Friends",
                        prefixicon: Res.inviteFriends,
                        suffixicon: Res.arrowforward,
                        ontap: () {
                          share();
                        },
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Divider(
                        color: AppColors.lightdarktextcolor.withOpacity(0.7),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      MyAccountCardWidgets(
                        height: 22,
                        width: 22,
                        text: "Help Center",
                        prefixicon: Res.helpercenter,
                        suffixicon: Res.arrowforward,
                        ontap: () {
                          toNext(context: context, widget: HelpCenter());
                        },
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Divider(
                        color: AppColors.lightdarktextcolor.withOpacity(0.7),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      MyAccountCardWidgets(
                        height: 22,
                        width: 22,
                        text: "Recipes",
                        prefixicon: Res.helpercenter,
                        suffixicon: Res.arrowforward,
                        ontap: () {
                          toNext(context: context, widget: RecipesListScreen());
                        },
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      AccountHeadingDividerWidget(
                        text: "Legal",
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      MyAccountCardWidgets(
                        height: 22,
                        width: 22,
                        text: "Terms & Conditions",
                        prefixicon: Res.termsandcondirionsvg,
                        suffixicon: Res.arrowforward,
                        ontap: () {
                          toNext(
                              context: context, widget: TermsAndConditions());
                        },
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Divider(
                        color: AppColors.lightdarktextcolor.withOpacity(0.7),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      MyAccountCardWidgets(
                        height: 22,
                        width: 22,
                        text: "Privacy Policy",
                        prefixicon: Res.termsandcondirionsvg,
                        suffixicon: Res.arrowforward,
                        ontap: () {
                          toNext(context: context, widget: PrivacyPolicy());
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: InkWell(
                            onTap: () async {
                              return await showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: AppColors.whitecolor,
                                      content: SizedBox(
                                        height: 100,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Do you want to Logout?",
                                                style: fontW5S12(context)!
                                                    .copyWith(
                                                  fontSize: 16,
                                                  color: AppColors.blackcolor,
                                                )),
                                            SizedBox(height: 20),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      authProvider
                                                          .logoutFromApp(
                                                              context);

                                                      // pe(msg: "yes selected");
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary: Colors
                                                                .red.shade800),
                                                    child: const Text("Yes"),
                                                  ),
                                                ),
                                                const SizedBox(width: 15),
                                                Expanded(
                                                    child: ElevatedButton(
                                                  onPressed: () {
                                                    // pe(msg: "no selected");
                                                    Navigator.of(context).pop();
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.white,
                                                  ),
                                                  child: const Text("No",
                                                      style: TextStyle(
                                                          color: Colors.black)),
                                                ))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.lightdarktextcolor
                                      .withOpacity(0.33),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Res.logoutsvg,
                                      height: 25,
                                      width: 25,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text("LogOut",
                                        style: TextStyle(
                                            // fontFamily: 'Gilroy',
                                            color: AppColors.blackcolor,
                                            // decoration: TextDecoration.underline,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Axiforma',
                                            fontSize: 14)),
                                  ],
                                ),
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Version  1.00.01",
                              style: TextStyle(
                                  // fontFamily: 'Gilroy',
                                  color: AppColors.lightdarktextcolor
                                      .withOpacity(0.8),
                                  // decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Axiforma',
                                  fontSize: 13)),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
              }));
    });
  }
}

Future<void> share() async {
  await FlutterShare.share(
      title: 'Cyglera App',
      text: 'Dietitian App',
      linkUrl: "wwww.cyglera.com",
      chooserTitle: 'CrowdVoice App');
}
