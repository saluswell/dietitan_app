import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:saluswell_dietitan_app_updated/src/workOutSection/models/workout_model.dart';
import 'package:video_player/video_player.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/cacheNetworkImageWidget.dart';

class WorkoutDetailScreen extends StatefulWidget {
  final WorkoutModel workoutModel;

  const WorkoutDetailScreen({Key? key, required this.workoutModel})
      : super(key: key);

  @override
  State<WorkoutDetailScreen> createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.workoutModel.workoutVideo.toString()),
    )..initialize().then((_) {
        // Ensure the first frame is shown and set the state
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _controller.dispose();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Workout Details",
            style: TextStyle(fontSize: 15),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0)),
                    child: Stack(
                      children: [
                        _controller.value.isInitialized
                            ? VideoPlayer(_controller)
                            : SpinKitPouringHourGlass(
                                size: 30, color: AppColors.appcolor),
                        Positioned(
                            child: Center(
                                child: InkWell(
                          onTap: () {
                            if (_controller.value.isPlaying) {
                              setState(() {
                                _controller.pause();
                              });
                            } else {
                              setState(() {
                                _controller.play();
                              });
                            }
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(65),
                            ),
                            child: _controller.value.isPlaying
                                ? Icon(
                                    Icons.pause,
                                    color: AppColors.whitecolor,
                                  )
                                : Icon(
                                    Icons.play_arrow,
                                    color: AppColors.whitecolor,
                                  ),
                          ),
                        )))
                      ],
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.workoutModel.workoutTitle.toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 20,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      widget.workoutModel.dateCreated!.toDate().format("d-M-Y"),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 12,
                          color: AppColors.darkAppColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  widget.workoutModel.workoutDuration.toString(),
                  style: fontW5S12(context)!.copyWith(
                      fontSize: 15,
                      color: AppColors.appcolor,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
