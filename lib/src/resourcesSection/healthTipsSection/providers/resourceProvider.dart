import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/helperFunctions/commonMethods.dart';
import '../../../../common/helperFunctions/getUserIDhelper.dart';
import '../../../../common/helperFunctions/navigatorHelper.dart';
import '../../../../common/helperFunctions/showsnackbar.dart';
import '../../../../common/helperFunctions/storage_services.dart';
import '../../../../common/utils/appcolors.dart';
import '../models/articleModel.dart';
import '../screens/articlesListScreen.dart';
import '../services/articleServices.dart';

class ResourceProvider extends ChangeNotifier {
  /// all variables
  File? articleImage;
  var articleImageurlVar;
  String? recordType;

  bool isLoading = false;

  List<String> recordvarList = [
    'Category Type',
    'Meal Plan',
    'Recipe',
    'Health Tip',
    'Diet Plan',
    "Education"
  ];

  updateRecordVarValue(val) {
    recordType = val;
    notifyListeners();
  }

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  ///controllers
  TextEditingController articletitleController = TextEditingController();
  TextEditingController articledescController = TextEditingController();

  ///services used
  ArticleServices articleServices = ArticleServices();
  StorageServices storageServices = StorageServices();

  /// Articles Section

  ///create article
  createArticle() async {
    if (articleImage == null) {
      showSnackBarMessage(
          backgroundcolor: AppColors.redcolor,
          contentColor: AppColors.whitecolor,
          context: navstate.currentState!.context,
          content: "Please upload article image ");
      return;
    }
    try {
      if (articleImage != null) {
        makeLoadingTrue();
        var profileimageurl = await storageServices.uploadFile(articleImage!);
        articleImageurlVar = profileimageurl;
        notifyListeners();
        articleServices.createArticle(ArticleModel(
            userId: getUserID(),
            articleTitle: articletitleController.text,
            articleDescription: articledescController.text,
            isApprovedByAdmin: false,
            categoryType: recordType,
            dateCreated: Timestamp.fromDate(DateTime.now()),
            articleImage: articleImageurlVar));
        makeLoadingFalse();
        clearArticleData() {
          articletitleController.clear();
          articledescController.clear();
          articleImage = null;
        }

        showSnackBarMessage(
            backgroundcolor: AppColors.blackcolor,
            contentColor: AppColors.whitecolor,
            context: navstate.currentState!.context,
            content:
                "Article Uploaded Sucessfully wait for approval from admin");
        Navigator.maybePop(navstate.currentState!.context);
      }
    } on FirebaseException catch (e) {
      makeLoadingFalse();
      showSnackBarMessage(
          backgroundcolor: AppColors.redcolor,
          contentColor: AppColors.whitecolor,
          context: navstate.currentState!.context,
          content: e.toString());
    }
  }

  editArticle(String articleID, String articleTitle, String articleDesc) async {
    if (articleImage != null) {
      makeLoadingTrue();
      var profileimageurl = await storageServices.uploadFile(articleImage!);
      articleImageurlVar = profileimageurl;
      notifyListeners();

      articleServices.updateArticleDetailswithImage(
          ArticleModel(
            articleTitle: articleTitle,
            articleDescription: articleDesc,
            articleImage: profileimageurl,
          ),
          articleID);
      makeLoadingFalse();
      showSnackBarMessage(
          backgroundcolor: AppColors.blackcolor,
          contentColor: AppColors.whitecolor,
          context: navstate.currentState!.context,
          content: "Article Updated Sucessfully.");
      toNext(
          context: navstate.currentState!.context,
          widget: ArticlesListScreen());
    } else {
      articleServices.updateArticleDetailswithoutImage(
          ArticleModel(
            articleTitle: articleTitle,
            articleDescription: articleDesc,
          ),
          articleID);
      makeLoadingFalse();
      toNext(
          context: navstate.currentState!.context,
          widget: ArticlesListScreen());
      showSnackBarMessage(
          backgroundcolor: AppColors.blackcolor,
          contentColor: AppColors.whitecolor,
          context: navstate.currentState!.context,
          content: "Article Updated Sucessfully.");
    }
  }

  ///stream Articels
  streamArticles() {
    try {
      articleServices.streamArticles(false);
    } on FirebaseException catch (e) {
      showSnackBarMessage(
          context: navstate.currentState!.context, content: e.toString());
    }
  }

  ///delete article
  deleteArticle(String articleID) {
    makeLoadingTrue();
    articleServices.deleteArticle(articleID).whenComplete(() {
      makeLoadingFalse();
      Navigator.maybePop(navstate.currentState!.context);
      toRemoveAll(
          context: navstate.currentState!.context,
          widget: ArticlesListScreen());
      showSnackBarMessage(
          context: navstate.currentState!.context,
          content: "Article Deleted Sucessfully");
    });
  }

  ///Clear article form data after uploading so it will clear from provider

  clearArticleData() {
    articletitleController.clear();
    articledescController.clear();
    articleImage = null;
  }

  /// pick article image

  pickArticleImage(context, ImageSource imageSource) async {
    var xFile = await CommonMethods.getImage(imageSource);
    if (xFile != null) {
      articleImage = File(xFile.path);
      notifyListeners();
    } else {
      showSnackBarMessage(
          context: navstate.currentState!.context,
          content: "Picture not picked");
    }
  }

  ///
}
