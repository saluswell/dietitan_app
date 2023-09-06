import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../../common/utils/appcolors.dart';
import '../../models/articleModel.dart';
import '../../providers/resourceProvider.dart';
import '../../services/articleServices.dart';
import '../../widgets/articlesTileWidget.dart';

class UploadedArticlesTab extends StatefulWidget {
  final List<ArticleModel> approvedarticlesList;

  const UploadedArticlesTab({Key? key, required this.approvedarticlesList})
      : super(key: key);

  @override
  State<UploadedArticlesTab> createState() => _UploadedArticlesTabState();
}

class _UploadedArticlesTabState extends State<UploadedArticlesTab> {
  ArticleServices articleServices = ArticleServices();

  @override
  Widget build(BuildContext context) {
    return Consumer<ResourceProvider>(builder: (context, resourceProvider, __) {
      return Scaffold(
        body: Column(
          children: [
            widget.approvedarticlesList.isEmpty
                ? const Center(
                    child: Padding(
                    padding: EdgeInsets.only(top: 210),
                    child: Text("No Article found! Create Article",
                        style: TextStyle(
                            // fontFamily: 'Gilroy',
                            color: AppColors.blackcolor,
                            // decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Axiforma',
                            fontSize: 13)),
                  ))
                : widget.approvedarticlesList[0].articleId == null
                    ? const SpinKitPouringHourGlass(
                        color: AppColors.appcolor,
                        size: 25,
                      )
                    : Expanded(
                        flex: 4,
                        child: ListView.builder(
                            itemCount: widget.approvedarticlesList.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 20),
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 0, left: 12, right: 14),
                                child: ArticlesTileWidget(
                                  articleModel:
                                      widget.approvedarticlesList[index],
                                  articleID: widget
                                      .approvedarticlesList[index].articleId
                                      .toString(),
                                ),
                              );
                            })),
                      )
          ],
        ),
      );
    });
  }
}
