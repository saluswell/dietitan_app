import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/helperFunctions/navigatorHelper.dart';
import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/themes.dart';
import '../models/articleModel.dart';
import '../providers/resourceProvider.dart';
import '../services/articleServices.dart';
import 'ArticlesTab/draftTab.dart';
import 'ArticlesTab/uploadedTab.dart';
import 'addArticleScreen.dart';

class ArticlesListScreen extends StatefulWidget {
  const ArticlesListScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesListScreen> createState() => _ArticlesListScreenState();
}

class _ArticlesListScreenState extends State<ArticlesListScreen> {
  ArticleServices articleServices = ArticleServices();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            body: StreamProvider.value(
                value: articleServices.streamArticles(true),
                initialData: [ArticleModel()],
                builder: (context, child) {
                  List<ArticleModel> aprrovedarticlesList =
                      context.watch<List<ArticleModel>>();
                  return StreamProvider.value(
                      value: articleServices.streamArticles(false),
                      //  value: resourceProvider.streamArticles(),
                      initialData: [ArticleModel()],
                      builder: (context, child) {
                        List<ArticleModel> articlesList =
                            context.watch<List<ArticleModel>>();
                        return Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.maybePop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: AppColors.appcolor,
                                  )),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Articles",
                                      style: fontW5S12(context)!.copyWith(
                                          fontSize: 23,
                                          color: AppColors.blackcolor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        toNext(
                                            context: context,
                                            widget: AddArticleScreen());
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 110,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(11),
                                            color: AppColors.lightwhitecolor),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.add,
                                                size: 20,
                                                color: AppColors.appcolor,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "Add New",
                                                style: fontW5S12(context)!
                                                    .copyWith(
                                                        fontSize: 14,
                                                        color:
                                                            AppColors.appcolor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TabBar(
                                labelStyle: fontW4S12(context)!.copyWith(
                                    color: AppColors.lightwhitecolor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                                indicatorPadding: EdgeInsets.only(),
                                indicatorWeight: 2,
                                isScrollable: true,
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorColor: AppColors.appcolor,
                                unselectedLabelColor:
                                    AppColors.lightdarktextcolor,
                                padding: EdgeInsets.only(right: 100),
                                tabs: [
                                  Consumer<ResourceProvider>(
                                      builder: (context, resourceProvider, __) {
                                    return Tab(
                                      text:
                                          "Uploaded (${aprrovedarticlesList.length})",
                                    );
                                  }),
                                  Consumer<ResourceProvider>(
                                      builder: (context, resourceProvider, __) {
                                    return Tab(
                                      text:
                                          "Pending for Approval (${articlesList.length})",
                                    );
                                  })
                                ]),
                            Expanded(
                              child: TabBarView(children: [
                                UploadedArticlesTab(
                                  approvedarticlesList: aprrovedarticlesList,
                                ),
                                DraftArticlesTab(
                                  articlesList: articlesList,
                                ),
                              ]),
                            )
                          ],
                        );
                      });
                })));
  }
}
