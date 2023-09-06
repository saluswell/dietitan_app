import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/helperFunctions/navigatorHelper.dart';
import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/themes.dart';
import '../../../../res.dart';
import '../widgets/resourcesTileWidget.dart';
import 'articlesListScreen.dart';

class ResourcesOpenScreen extends StatefulWidget {
  const ResourcesOpenScreen({Key? key}) : super(key: key);

  @override
  State<ResourcesOpenScreen> createState() => _ResourcesOpenScreenState();
}

class _ResourcesOpenScreenState extends State<ResourcesOpenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upload",
                  style: fontW5S12(context)!.copyWith(
                      fontSize: 22,
                      color: AppColors.blackcolor,
                      fontWeight: FontWeight.w700),
                ),
                SvgPicture.asset(
                  Res.notificationbell,
                  height: 30,
                  width: 30,
                )
              ],
            ),
          ),
          SizedBox(
            height: 22,
          ),
          ResourcesTileWidget(
            text: "Tap to Upload",
            onTap: () {
              toNext(context: context, widget: ArticlesListScreen());
            },
            leadingImage: Res.articles,
          ),
          SizedBox(
            height: 10,
          ),
          // ResourcesTileWidget(
          //   text: "Diet Plans",
          //   onTap: () {},
          //   leadingImage: Res.dietplans,
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // ResourcesTileWidget(
          //   text: "Recipes",
          //   onTap: () {},
          //   leadingImage: Res.recipes,
          // )
        ],
      ),
    );
  }
}
