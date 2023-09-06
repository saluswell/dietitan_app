import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';


import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/cacheNetworkImageWidget.dart';

class ChatTile extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String time;
  final bool isChat;
  final int? counter;

  ChatTile(
      {required this.image,
      required this.title,
      required this.description,
      required this.time,
      this.counter,
      this.isChat = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
            leading: CacheNetworkImageWidget(
              height: 45,
              width: 45,
              imgUrl: image,
              radius: 33,
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: fontW5S12(context)!.copyWith(
                    fontSize: 17,
                    color: AppColors.blackcolor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            subtitle: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                description,
                style: fontW5S12(context)!.copyWith(
                    fontSize: 10,
                    color: AppColors.lightdarktextcolor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            trailing: _getBadge(counter!)),
        Divider()
      ],
    );
  }

  _getBadge(int counter) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          time.toString(),
          style: fontW5S12(navstate.currentState!.context)!.copyWith(
              fontSize: 10,
              color: AppColors.lightdarktextcolor,
              fontWeight: FontWeight.w500),
        ),
        if (counter != 0)
          SizedBox(
            height: 5,
          ),
        if (counter != 0)
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.appcolor),
            child: Center(
              child: Text(
                counter.toString(),
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
      ],
    );
  }
}
