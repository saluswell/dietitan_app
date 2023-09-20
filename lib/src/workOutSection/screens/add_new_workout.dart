import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/common/helperFunctions/dialogHelper.dart';
import 'package:saluswell_dietitan_app_updated/src/recipesSection/providers/recipes_provider.dart';
import 'package:saluswell_dietitan_app_updated/src/workOutSection/providers/workout_provider.dart';
import 'package:video_player/video_player.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/textfield_widget.dart';

class AddNewWorkoutScreen extends StatefulWidget {
  const AddNewWorkoutScreen({Key? key}) : super(key: key);

  @override
  State<AddNewWorkoutScreen> createState() => _AddNewWorkoutScreenState();
}

class _AddNewWorkoutScreenState extends State<AddNewWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();

  // late VideoPlayerController _controller;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.networkUrl(Uri.parse(
  //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       setState(() {});
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(builder: (context, workoutProvider, __) {
      return LoadingOverlay(
        isLoading: workoutProvider.isLoading,
        progressIndicator: SpinKitPouringHourGlass(
          color: AppColors.appcolor,
          size: 25,
        ),
        child: Scaffold(
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonButtonWidget(
                  horizontalPadding: 8,
                  backgroundcolor: AppColors.appcolor,
                  text: "Upload Workout",
                  textfont: 16,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      workoutProvider.createWorkoutProvider();
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
                          "Add Workout",
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
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          "Choose Workout Video",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 16,
                              color: AppColors.blackcolor,
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
                      child: workoutProvider.workoutVideo == null
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
                                      workoutProvider.pickWorkoutVideo(
                                          context, ImageSource.gallery);
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
                                            Text("Add Video",
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

                                    // image: DecorationImage(
                                    //   fit: BoxFit.cover,
                                    //   image: FileImage(
                                    //       workoutProvider.workoutVideo!),
                                    // ),
                                  ),
                                  child: workoutProvider
                                          .videoController.value.isInitialized
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Stack(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  AspectRatio(
                                                    aspectRatio: workoutProvider
                                                        .videoController
                                                        .value
                                                        .aspectRatio,
                                                    child: VideoPlayer(
                                                        workoutProvider
                                                            .videoController),
                                                  ),
                                                ],
                                              ),
                                              Positioned(
                                                  child: Center(
                                                      child: InkWell(
                                                onTap: () {
                                                  if (workoutProvider
                                                      .videoController
                                                      .value
                                                      .isPlaying) {
                                                    setState(() {
                                                      workoutProvider
                                                          .videoController
                                                          .pause();
                                                    });
                                                  } else {
                                                    setState(() {
                                                      workoutProvider
                                                          .videoController
                                                          .play();
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  height: 35,
                                                  width: 35,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            65),
                                                  ),
                                                  child: workoutProvider
                                                          .videoController
                                                          .value
                                                          .isPlaying
                                                      ? Icon(
                                                          Icons.pause,
                                                          color: AppColors
                                                              .whitecolor,
                                                        )
                                                      : Icon(
                                                          Icons.play_arrow,
                                                          color: AppColors
                                                              .whitecolor,
                                                        ),
                                                ),
                                              )))
                                            ],
                                          ),
                                        )
                                      : SpinKitPulse(),
                                ),
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
                                                workoutProvider
                                                    .pickWorkoutVideo(context,
                                                        ImageSource.gallery);
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
                          "Workout Title ",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          " (Max Chars: 50)",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
                              color: AppColors.lightdarktextcolor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //     height: 200,
                  //     width: 200,
                  //     child: VideoPlayer(workoutProvider.videoController)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFieldWidget(
                        showSuffixIcon: false,
                        controller: workoutProvider.workoutTitleController,
                        textFieldHeight: 55,
                        maxlines: 1,
                        maxLengt: 50,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter workout title";
                          }
                          return null;
                        },
                        toppadding: 18,
                        hintText: "Enter Title",
                        textInputType: TextInputType.emailAddress),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          "Workout Duration ",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          " (Max Chars: 50)",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
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
                        controller: workoutProvider.workoutDurationController,
                        textFieldHeight: 55,
                        maxlines: 1,
                        maxLengt: 50,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter workout duration";
                          }
                          return null;
                        },
                        toppadding: 18,
                        hintText: "Enter Duration",
                        textInputType: TextInputType.emailAddress),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 30,
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

/// diet type
// DialogHelper.showBottomSheet(
// widget: Container(
// height: 500,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// SizedBox(
// height: 30,
// ),
// Text(
// "Choose Diet Type",
// style: fontW5S12(context)!.copyWith(
// fontSize: 16,
// color: AppColors.blackcolor,
// fontWeight: FontWeight.w600),
// ),
// SizedBox(
// height: 20,
// ),
// Expanded(
// child: ListView.builder(
// itemCount: recipesProvider.dietTypes.length,
// padding: EdgeInsets.only(bottom: 20),
// itemBuilder: (context, index) {
// final dietItems =
// Provider.of<RecipesProvider>(context)
//     .dietTypes;
// final item = dietItems[index];
//
// final isSelected = recipesProvider
//     .selectedDietTypes
//     .contains(item);
// return Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 12, vertical: 5),
// child: InkWell(
// onTap: () {
// Provider.of<RecipesProvider>(context,
// listen: false)
//     .toggleDietTypeSelection(index);
// },
// child: SizedBox(
// height: 50,
// child: Card(
// shape: RoundedRectangleBorder(
// borderRadius:
// BorderRadius.circular(7)),
// elevation: 4,
// child: Padding(
// padding:
// const EdgeInsets.symmetric(
// horizontal: 12),
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment
//     .spaceBetween,
// children: [
// Text(
// item.name,
// style: TextStyle(
// fontSize: 14,
// fontWeight:
// FontWeight.w600,
// color: AppColors
//     .blackcolor),
// ),
// Container(
// child: isSelected
// ? Icon(
// Icons.check,
// color: AppColors
//     .appcolor,
// )
//     : null,
// )
// ],
// ),
// ),
// ),
// ),
// ),
// );
// }),
// )
// ],
// ),
// ));
