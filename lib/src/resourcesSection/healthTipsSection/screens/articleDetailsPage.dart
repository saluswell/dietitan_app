// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../common/helperFunctions/dateFromatter.dart';
import '../../../../common/helperFunctions/navigatorHelper.dart';
import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/themes.dart';
import '../../../../common/widgets/cacheNetworkImageWidget.dart';
import '../../../../res.dart';
import '../models/articleModel.dart';
import '../providers/resourceProvider.dart';
import 'editArticle.dart';

class ArticleDetailsPage extends StatelessWidget {
  final ArticleModel articleModel;
  final String articleID;

  const ArticleDetailsPage(
      {Key? key, required this.articleModel, required this.articleID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ResourceProvider>(builder: (context, resourceProvider, __) {
      return LoadingOverlay(
        isLoading: resourceProvider.isLoading,
        progressIndicator: const SpinKitPouringHourGlass(
          size: 30,
          color: AppColors.appcolor,
        ),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.maybePop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.appcolor,
                        )),
                    Text(
                      "Article Details",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 19,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text("        ")
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                articleModel.articleImage == null
                    ? Container(
                        height: 200,
                        width: 400,
                        decoration: BoxDecoration(
                            color: AppColors.lightwhitecolor,
                            borderRadius: BorderRadius.circular(13),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(Res.articelsImagepng))))
                    : CacheNetworkImageWidget(
                        height: 200,
                        width: 400,
                        //  width: 60,
                        imgUrl: articleModel.articleImage.toString(),
                        radius: 2,
                      ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "Posted " +
                            DateFormatter.dateFormatter(
                                articleModel.dateCreated!.toDate()),
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: AppColors.lightdarktextcolor,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Row(children: [
                      Expanded(
                        flex: 5,
                        child: InkWell(
                          onTap: () async {
                            toNext(
                                context: context,
                                widget: EditArticleScreen(
                                  articleModel: articleModel,
                                  articleID: articleID,
                                ));
                            // share();
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.appcolor.withOpacity(0.8),
                              //  border: Border.all(width: 1.5, color: bordercolor),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: AppColors.whitecolor,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text("Edit",
                                      style: const TextStyle(
                                          // fontFamily: 'Gilroy',
                                          color: AppColors.whitecolor,
                                          // decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Axiforma',
                                          fontSize: 14)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 5,
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
                                          Text("Are you sure you want to ",
                                              style:
                                                  fontW5S12(context)!.copyWith(
                                                fontSize: 16,
                                                color: AppColors.blackcolor,
                                              )),
                                          Text("delete Health Tip?",
                                              style:
                                                  fontW5S12(context)!.copyWith(
                                                fontSize: 16,
                                                color: AppColors.blackcolor,
                                              )),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: ElevatedButton(
                                                onPressed: () {
                                                  resourceProvider
                                                      .deleteArticle(
                                                          articleModel.articleId
                                                              .toString());
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary:
                                                        Colors.red.shade800),
                                                child: const Text("Yes"),
                                              )),
                                              const SizedBox(width: 15),
                                              Expanded(
                                                  child: ElevatedButton(
                                                onPressed: () {
                                                  // pe(msg: "no selected");
                                                  Navigator.of(context).pop();
                                                },
                                                style: ElevatedButton.styleFrom(
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
                            // share();
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.redcolor.withOpacity(0.8),
                              //  border: Border.all(width: 1.5, color: bordercolor),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: AppColors.whitecolor,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  const Text("Delete",
                                      style: const TextStyle(
                                          // fontFamily: 'Gilroy',
                                          color: AppColors.whitecolor,
                                          // decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Axiforma',
                                          fontSize: 14)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ])),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Status",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 16,
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        articleModel.isApprovedByAdmin == true
                            ? "Approved from admin"
                            : "Pending for approval from admin",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: articleModel.isApprovedByAdmin == true
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Article  Title",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 16,
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        articleModel.articleTitle.toString(),
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 19,
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Description",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 17,
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 330,
                  child: RichText(
                    //   maxLines: 2,
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 36),
                      children: <TextSpan>[
                        TextSpan(
                            text: articleModel.articleDescription.toString(),
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: AppColors.blackcolor.withOpacity(0.8))),
                      ],
                    ),
                    textScaleFactor: 0.7,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
