import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saluswell_dietitan_app_updated/common/helperFunctions/getUserIDhelper.dart';
import 'package:saluswell_dietitan_app_updated/common/helperFunctions/storage_services.dart';
import 'package:saluswell_dietitan_app_updated/src/workOutSection/models/workout_model.dart';
import 'package:saluswell_dietitan_app_updated/src/workOutSection/screens/workouts_list.dart';
import 'package:saluswell_dietitan_app_updated/src/workOutSection/services/workout_services.dart';
import 'package:video_player/video_player.dart';

import '../../../common/helperFunctions/commonMethods.dart';
import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/helperFunctions/showsnackbar.dart';
import '../../../common/utils/appcolors.dart';

class WorkoutProvider extends ChangeNotifier {
  bool isLoading = false;

  File? workoutVideo;

  late VideoPlayerController videoController;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  TextEditingController workoutTitleController = TextEditingController();
  TextEditingController workoutDurationController = TextEditingController();

  pickWorkoutVideo(context, ImageSource imageSource) async {
    var xFile = await CommonMethods.getVideo(imageSource);
    if (xFile != null) {
      workoutVideo = File(xFile.path);
      intializeVideoWithController();
      //notifyListeners();
    } else {
      showSnackBarMessage(
          context: navstate.currentState!.context, content: "Video not picked");
    }
  }

  intializeNetWorkVideoWithController(String videoUrl) {
    videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl) //
        // Replace with your video URL
        )
      ..initialize().then((value) {
        notifyListeners();
      });
  }

  intializeVideoWithController() {
    videoController = VideoPlayerController.file(workoutVideo! //
        // Replace with your video URL
        )
      ..initialize().then((value) {
        notifyListeners();
      });

    // videoController.addListener(() {
    //   videoController.position.whenComplete(() {
    //     videoController.pause();
    //     notifyListeners();
    //   });
    // });
  }

  WorkoutServices workoutServices = WorkoutServices();
  StorageServices storageServices = StorageServices();
  var workoutVideoUrlVar;

  createWorkoutProvider() async {
    try {
      if (workoutVideo != null) {
        makeLoadingTrue();
        var profileimageurl = await storageServices.uploadFile(workoutVideo!);
        workoutVideoUrlVar = profileimageurl;
        notifyListeners();

        workoutServices
            .createWorkout(WorkoutModel(
                workoutTitle: workoutTitleController.text,
                workoutDuration: workoutDurationController.text,
                isApprovedByAdmin: false,
                userId: getUserID(),
                dateCreated: Timestamp.fromDate(DateTime.now()),
                workoutVideo: workoutVideoUrlVar))
            .then((value) {
          makeLoadingFalse();
          workoutTitleController.clear();
          workoutDurationController.clear();
          workoutVideo = null;
          //videoController.dispose();
          toNext(
              context: navstate.currentState!.context,
              widget: WorkoutsListScreen());

          // Navigator.maybePop(navstate.currentState!.context);

          showSnackBarMessage(
              backgroundcolor: AppColors.appcolor,
              contentColor: AppColors.whitecolor,
              context: navstate.currentState!.context,
              content: "Workout Added Successfully");
        });
      }
    } catch (e) {
      makeLoadingFalse();
      showSnackBarMessage(
          context: navstate.currentState!.context, content: e.toString());
      // TODO
    }
  }
}
