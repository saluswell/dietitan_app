import 'package:flutter/material.dart';

import '../../../../common/helperFunctions/dateFromatter.dart';
import '../../../../common/helperFunctions/navigatorHelper.dart';
import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/themes.dart';
import '../../../../common/widgets/cacheNetworkImageWidget.dart';
import '../../../../res.dart';
import '../models/articleModel.dart';
import '../screens/articleDetailsPage.dart';

class ArticlesTileWidget extends StatelessWidget {
  final ArticleModel? articleModel;
  final String articleID;
  const ArticlesTileWidget({
    Key? key,
    this.articleModel,
    required this.articleID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        toNext(
            context: context,
            widget: ArticleDetailsPage(
              articleModel: articleModel!,
              articleID: articleID,
            ));
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    articleModel!.articleImage == null
                        ? Container(
                            height: 52,
                            width: 52,
                            decoration: BoxDecoration(
                                color: AppColors.lightwhitecolor,
                                borderRadius: BorderRadius.circular(13),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(Res.articelsImagepng))))
                        : CacheNetworkImageWidget(
                            height: 55,
                            width: 60,
                            imgUrl: articleModel!.articleImage.toString(),
                            radius: 7,
                          ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articleModel!.articleTitle.toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    SizedBox(
                      width: 160,
                      child: RichText(
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 36),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    articleModel!.articleDescription.toString(),
                                style: fontW5S12(context)!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightdarktextcolor)),
                          ],
                        ),
                        textScaleFactor: 0.7,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    )
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: Text(
                    DateFormatter.dateFormatter(
                        articleModel!.dateCreated!.toDate()),
                    style: fontW5S12(context)!.copyWith(
                        fontSize: 11,
                        color: AppColors.lightdarktextcolor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
