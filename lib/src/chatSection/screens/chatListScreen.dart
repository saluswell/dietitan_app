import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../res.dart';
import '../widgets/chatListTileWidget.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Chat",
                  style: fontW5S12(context)!.copyWith(
                      fontSize: 23,
                      color: AppColors.blackcolor,
                      fontWeight: FontWeight.w700),
                ),
                Container(
                  height: 42,
                  width: 85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: AppColors.lightwhitecolor),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Res.editicon),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "New",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 14,
                              color: AppColors.appcolor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView.builder(
                itemCount: 12,
                shrinkWrap: true,
                padding: EdgeInsets.only(
                    top: 20
                ),
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12,left: 12,right: 14),
                    child: ChatListTileWidget(),
                  );
                })),
          )
        ],
      ),
    );
  }
}
