import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/cacheNetworkImageWidget.dart';
import '../../../res.dart';
import '../../authenticationsection/Models/userModel.dart';
import 'myProfileTab/aboutTab.dart';
import 'myProfileTab/reviewsTab.dart';

class MyProfileScreen extends StatefulWidget {
  final UserModel userModel;

  const MyProfileScreen({Key? key, required this.userModel}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 200,
              //  width: 400,
              decoration: const BoxDecoration(
                  color: AppColors.appcolor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: const Radius.circular(25),
                      bottomRight: const Radius.circular(25))),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: InkWell(
                          onTap: () {
                            Navigator.maybePop(context);
                          },
                          child: SizedBox(
                            height: 45,
                            width: 45,
                            child: const Card(
                              color: AppColors.whitecolor,
                              elevation: 4,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    bottom: 4,
                                    top: 4,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: AppColors.appcolor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    widget.userModel.profilePicture == null
                        ? Container(
                            height: 70,
                            width: 80,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(Res.articelsImagepng)),
                                borderRadius: BorderRadius.circular(13)),
                          )
                        : CacheNetworkImageWidget(
                            height: 80,
                            width: 90,
                            imgUrl: widget.userModel.profilePicture.toString(),
                            radius: 7,
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star_border,
                            color: Colors.amber,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "(4.7)",
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 14,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userModel.userName.toString(),
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 16,
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.userModel.emailAdress.toString(),
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 11,
                            color: AppColors.blackcolor.withOpacity(0.6),
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.userModel.personalInformationModel!.title
                            .toString(),
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 12,
                            color: AppColors.appcolor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      //   toNext(context: context, widget: EditProfileScreen());
                    },
                    child: Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: AppColors.lightwhitecolor),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Res.editicon),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Edit Profile",
                              style: fontW5S12(context)!.copyWith(
                                  fontSize: 13,
                                  color: AppColors.appcolor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TabBar(
                labelStyle: fontW4S12(context)!.copyWith(
                    color: AppColors.lightwhitecolor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
                indicatorPadding: const EdgeInsets.only(),
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: AppColors.appcolor,
                unselectedLabelColor: AppColors.lightdarktextcolor,
                padding: const EdgeInsets.only(),
                tabs: const [
                  Tab(
                    text: "Reviews",
                  ),
                  Tab(
                    text: "About",
                  )
                ]),
            Expanded(
              child: TabBarView(children: [
                ReviewListTabScreen(),
                AboutUserProfileTabScreen(
                  userModel: widget.userModel,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
