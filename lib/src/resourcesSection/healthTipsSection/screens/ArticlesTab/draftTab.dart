
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';


import '../../../../../common/utils/appcolors.dart';
import '../../models/articleModel.dart';
import '../../providers/resourceProvider.dart';
import '../../services/articleServices.dart';
import '../../widgets/articlesTileWidget.dart';

class DraftArticlesTab extends StatefulWidget {
  final List<ArticleModel> articlesList;
  const DraftArticlesTab({Key? key, required this.articlesList})
      : super(key: key);

  @override
  State<DraftArticlesTab> createState() => _DraftArticlesTabState();
}

class _DraftArticlesTabState extends State<DraftArticlesTab> {
  ArticleServices articleServices = ArticleServices();

  @override
  Widget build(BuildContext context) {
    return Consumer<ResourceProvider>(builder: (context, resourceProvider, __) {
      return Scaffold(
          body: Column(
        children: [
          widget.articlesList.isEmpty
              ? const Center(
                  child: Padding(
                  padding: EdgeInsets.only(top: 90),
                  child: Text("No Article  found! Create Article",
                      style: TextStyle(
                          // fontFamily: 'Gilroy',
                          color: AppColors.blackcolor,
                          // decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Axiforma',
                          fontSize: 13)),
                ))
              : widget.articlesList[0].articleId == null
                  ? const SpinKitPouringHourGlass(
                      color: AppColors.appcolor,
                      size: 25,
                    )
                  : Expanded(
                      flex: 4,
                      child: ListView.builder(
                          itemCount: widget.articlesList.length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 20),
                          itemBuilder: ((context, index) {
                            // if (  widget.articlesList.length > 0) {
                            //   resourceProvider
                            //           .pendArticleListlengthvar =
                            //         widget.articlesList.length;
                            // }

                            return Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 0, left: 12, right: 14),
                              child: ArticlesTileWidget(
                                articleModel: widget.articlesList[index],
                                articleID: widget.articlesList[index].articleId
                                    .toString(),
                              ),
                            );
                          })),
                    )
        ],
      ));
    });
  }
}
