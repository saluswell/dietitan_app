import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../common/helperFunctions/showsnackbar.dart';
import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/themes.dart';
import '../../../../common/widgets/button_widget.dart';
import '../../../../common/widgets/textfield_widget.dart';
import '../models/articleModel.dart';
import '../providers/resourceProvider.dart';

class EditArticleScreen extends StatefulWidget {
  final ArticleModel articleModel;
  final String articleID;
  const EditArticleScreen(
      {Key? key, required this.articleModel, required this.articleID})
      : super(key: key);

  @override
  State<EditArticleScreen> createState() => _EditArticleScreenState();
}

class _EditArticleScreenState extends State<EditArticleScreen> {
  TextEditingController articletitleController = TextEditingController();
  TextEditingController articledescController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    ///We have to populate our text editing controllers with speicifid product details
    articletitleController =
        TextEditingController(text: widget.articleModel.articleTitle);
    articledescController =
        TextEditingController(text: widget.articleModel.articleDescription);

    //contactNumberController = TextEditingController(text: widget.userimage);
    super.initState();
  }

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
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonButtonWidget(
                  horizontalPadding: 8,
                  backgroundcolor: AppColors.appcolor,
                  text: "Update Health Tip",
                  textfont: 16,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      resourceProvider.editArticle(
                        widget.articleID,
                        articletitleController.text,
                        articledescController.text,
                      );
                      dp(msg: "article ID", arg: widget.articleID);
                    }
                    // toNext(
                    //     context: context,
                    //     widget: BottomNavScreen());
                  }),
              const SizedBox(
                height: 25,
              )
            ],
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.maybePop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.appcolor,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Update Health Tip",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 23,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w700),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.maybePop(context);
                          },
                          child: Container(
                            height: 40,
                            width: 95,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: AppColors.redcolor.withOpacity(0.1)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.close,
                                    size: 20,
                                    color: AppColors.redcolor,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Cancel",
                                    style: fontW5S12(context)!.copyWith(
                                        fontSize: 14,
                                        color: AppColors.redcolor,
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
                    height: 5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          "Choose Cover Image",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 16,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          " (Max Size: 5 Mb)",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 16,
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
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: resourceProvider.articleImage == null
                          ? Stack(
                              children: [
                                Container(
                                    height: 150,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: AppColors.lightwhitecolor
                                            .withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Image.network(
                                      widget.articleModel.articleImage
                                          .toString(),
                                      fit: BoxFit.cover,
                                    )),
                                Positioned.fill(
                                  top: -60,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        child: Center(
                                          child: IconButton(
                                              icon: const Icon(
                                                Icons.camera_alt_outlined,
                                                color: Colors.white,
                                                size: 19,
                                              ),
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: ((context) =>
                                                        SimpleDialog(
                                                          title: const Text(
                                                              "Select Docs"),
                                                          children: [
                                                            Row(
                                                              children: [
                                                                SimpleDialogOption(
                                                                  child: Row(
                                                                    children: const [
                                                                      Icon(Icons
                                                                          .image),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                          "Gallery"),
                                                                    ],
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    //
                                                                    resourceProvider.pickArticleImage(
                                                                        context,
                                                                        ImageSource
                                                                            .gallery);
                                                                    Navigator.pop(
                                                                        context);
                                                                    //
                                                                  },
                                                                ),
                                                                SimpleDialogOption(
                                                                  child: Row(
                                                                    children: const [
                                                                      Icon(Icons
                                                                          .camera_alt),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                          "Camera"),
                                                                    ],
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    resourceProvider.pickArticleImage(
                                                                        context,
                                                                        ImageSource
                                                                            .camera);
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        )));
                                              }),
                                        ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.appcolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Stack(
                              children: [
                                Container(
                                    height: 150,
                                    width: double.infinity,
                                    // child: SvgPicture.asset(
                                    //   Res.invitefriendbanner,
                                    //   fit: BoxFit.cover,
                                    // ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17),
                                      border: Border.all(
                                          width: 3, color: AppColors.appcolor),
                                      //shape: BoxShape.circle,

                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(
                                            resourceProvider.articleImage!),
                                      ),
                                    )),
                                Positioned.fill(
                                  top: -60,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        child: Center(
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.camera_alt_outlined,
                                                color: Colors.white,
                                                size: 19,
                                              ),
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: ((context) =>
                                                        SimpleDialog(
                                                          title: const Text(
                                                              "Select Docs"),
                                                          children: [
                                                            Row(
                                                              children: [
                                                                SimpleDialogOption(
                                                                  child: Row(
                                                                    children: const [
                                                                      Icon(Icons
                                                                          .image),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                          "Gallery"),
                                                                    ],
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    //
                                                                    resourceProvider.pickArticleImage(
                                                                        context,
                                                                        ImageSource
                                                                            .gallery);
                                                                    Navigator.pop(
                                                                        context);
                                                                    //
                                                                  },
                                                                ),
                                                                SimpleDialogOption(
                                                                  child: Row(
                                                                    children: const [
                                                                      Icon(Icons
                                                                          .camera_alt),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                          "Camera"),
                                                                    ],
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    resourceProvider.pickArticleImage(
                                                                        context,
                                                                        ImageSource
                                                                            .camera);
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        )));
                                              }),
                                        ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.appcolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          "Article Title ",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 16,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          " (Max Chars: 50)",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 16,
                              color: AppColors.lightdarktextcolor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFieldWidget(
                        showSuffixIcon: false,
                        controller: articletitleController,
                        textFieldHeight: 55,
                        maxlines: 1,
                        maxLengt: 50,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter article title";
                          }
                          return null;
                        },
                        toppadding: 18,
                        hintText: "Enter Title",
                        textInputType: TextInputType.emailAddress),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          "Article Description",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 16,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          " (Max Chars: 500)",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 16,
                              color: AppColors.lightdarktextcolor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFieldWidget(
                        showSuffixIcon: false,
                        controller: articledescController,
                        textFieldHeight: 120,
                        maxLengt: 500,
                        maxlines: 7,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter article description";
                          }
                          return null;
                        },
                        toppadding: 18,
                        hintText: "Enter Description",
                        textInputType: TextInputType.emailAddress),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
