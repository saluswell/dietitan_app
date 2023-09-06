import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/themes.dart';
import '../../../../common/widgets/button_widget.dart';
import '../../../../common/widgets/textfield_widget.dart';
import '../providers/resourceProvider.dart';
import '../widgets/dropdown_widget.dart';

class AddArticleScreen extends StatefulWidget {
  const AddArticleScreen({Key? key}) : super(key: key);

  @override
  State<AddArticleScreen> createState() => _AddArticleScreenState();
}

class _AddArticleScreenState extends State<AddArticleScreen> {
  final _formKey = GlobalKey<FormState>();

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
                  text: "Upload Article",
                  textfont: 16,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      resourceProvider.createArticle();
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
                          "Add Article",
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
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: CustomDropDownWidget(
                              value: resourceProvider.recordType == null
                                  ? "Category Type"
                                  : resourceProvider.recordType.toString(),
                              list: resourceProvider.recordvarList,
                              onChanged: (value) {
                                resourceProvider.updateRecordVarValue(value);
                              },
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                          ? Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.lightdarktextcolor
                                      .withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: ((context) => SimpleDialog(
                                                title: const Text(
                                                  "Select Docs",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.whitecolor),
                                                ),
                                                children: [
                                                  Row(
                                                    children: [
                                                      SimpleDialogOption(
                                                        child: Row(
                                                          children: const [
                                                            Icon(
                                                              Icons.image,
                                                              color: AppColors
                                                                  .whitecolor,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              "Gallery",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .whitecolor),
                                                            ),
                                                          ],
                                                        ),
                                                        onPressed: () {
                                                          //
                                                          resourceProvider
                                                              .pickArticleImage(
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
                                                            Icon(
                                                              Icons.camera_alt,
                                                              color: AppColors
                                                                  .whitecolor,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              "Camera",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .whitecolor),
                                                            ),
                                                          ],
                                                        ),
                                                        onPressed: () {
                                                          resourceProvider
                                                              .pickArticleImage(
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
                                      //  getImage(true);
                                    },
                                    child: Container(
                                      height: 47,
                                      width: 145,
                                      decoration: BoxDecoration(
                                          color: AppColors.lightwhitecolor,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: AppColors.appcolor,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text("Add Image",
                                                style: TextStyle(
                                                    // fontFamily: 'Gilroy',
                                                    color: AppColors.blackcolor,
                                                    // decoration: TextDecoration.underline,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Axiforma',
                                                    fontSize: 13)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Preview will appear here ",
                                      style: TextStyle(
                                          // fontFamily: 'Gilroy',
                                          color: AppColors.appcolor,
                                          // decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Axiforma',
                                          fontSize: 13)),
                                  const Text(" after uploading",
                                      style: TextStyle(
                                          // fontFamily: 'Gilroy',
                                          color: AppColors.appcolor,
                                          // decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Axiforma',
                                          fontSize: 13)),
                                ],
                              ),
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
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.appcolor,
                                        ),
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
                                                    builder:
                                                        ((context) =>
                                                            SimpleDialog(
                                                              title: const Text(
                                                                "Select Docs",
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .whitecolor),
                                                              ),
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SimpleDialogOption(
                                                                      child:
                                                                          Row(
                                                                        children: const [
                                                                          Icon(
                                                                            Icons.image,
                                                                            color:
                                                                                AppColors.whitecolor,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                            "Gallery",
                                                                            style:
                                                                                TextStyle(color: AppColors.whitecolor),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        //
                                                                        resourceProvider.pickArticleImage(
                                                                            context,
                                                                            ImageSource.gallery);
                                                                        Navigator.pop(
                                                                            context);
                                                                        //
                                                                      },
                                                                    ),
                                                                    SimpleDialogOption(
                                                                      child:
                                                                          Row(
                                                                        children: const [
                                                                          Icon(
                                                                            Icons.camera_alt,
                                                                            color:
                                                                                AppColors.whitecolor,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                            "Camera",
                                                                            style:
                                                                                TextStyle(color: AppColors.whitecolor),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        resourceProvider.pickArticleImage(
                                                                            context,
                                                                            ImageSource.camera);
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            )));
                                                // getImage(true);
                                              }),
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
                        controller: resourceProvider.articletitleController,
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
                        controller: resourceProvider.articledescController,
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
