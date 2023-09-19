import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/src/workOutSection/providers/workout_provider.dart';
import 'package:video_player/video_player.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/cacheNetworkImageWidget.dart';
import '../models/workout_model.dart';
import '../screens/workout_detail_screen.dart';

class WorkOutsCardWidget extends StatefulWidget {
  final WorkoutModel workoutModel;

  const WorkOutsCardWidget({Key? key, required this.workoutModel})
      : super(key: key);

  @override
  State<WorkOutsCardWidget> createState() => _WorkOutsCardWidgetState();
}

class _WorkOutsCardWidgetState extends State<WorkOutsCardWidget> {
  // @override
  // void initState() {
  //   // context.read<WorkoutProvider>().intializeNetWorkVideoWithController(
  //   //     widget.workoutModel.workoutVideo.toString());
  //
  //   late VideoPlayerController _controller;
  //
  //
  //   super.initState();
  // }
  late VideoPlayerController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.networkUrl(
  //     Uri.parse(widget.workoutModel.workoutVideo.toString()),
  //   )..initialize().then((_) {
  //       // Ensure the first frame is shown and set the state
  //       setState(() {});
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(builder: (context, workoutProvider, __) {
      return InkWell(
        onTap: () {
          toNext(
              context: context,
              widget: WorkoutDetailScreen(
                workoutModel: widget.workoutModel,
              ));
        },
        child: Container(
          height: 35,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   height: 55,
                //   width: 55,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(8),
                //
                //   ),
                // )
                // Container(
                //   height: 150,
                //   width: MediaQuery.of(context).size.width,
                //   child: ClipRRect(
                //       borderRadius: BorderRadius.only(
                //           topRight: Radius.circular(13),
                //           topLeft: Radius.circular(13),
                //           bottomLeft: Radius.circular(7),
                //           bottomRight: Radius.circular(7)),
                //       child: Stack(
                //         children: [
                //           // _controller.value.isInitialized
                //           //     ? VideoPlayer(workoutProvider.videoController)
                //           //     : SpinKitPouringHourGlass(
                //           //         size: 30, color: AppColors.appcolor),
                //           Positioned(
                //               child: Center(
                //                   child: InkWell(
                //             onTap: () {
                //               if (_controller.value.isPlaying) {
                //                 setState(() {
                //                   _controller.pause();
                //                 });
                //               } else {
                //                 setState(() {
                //                   _controller.play();
                //                 });
                //               }
                //             },
                //             child: Container(
                //               height: 35,
                //               width: 35,
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(65),
                //               ),
                //               child: _controller.value.isPlaying
                //                   ? Icon(
                //                       Icons.pause,
                //                       color: AppColors.whitecolor,
                //                     )
                //                   : Icon(
                //                       Icons.play_arrow,
                //                       color: AppColors.whitecolor,
                //                     ),
                //             ),
                //           )))
                //         ],
                //       )),
                // ),
                // CacheNetworkImageWidget(
                //   imgUrl: recipesList[index]
                //       .recipeImage
                //       .toString(),
                //   width: MediaQuery.of(context)
                //       .size
                //       .width,
                //   radius: 7,
                //   height: 160,
                // ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/Images/weight.png",
                            height: 35,
                            width: 35,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: [
                              Text(
                                widget.workoutModel.workoutTitle.toString(),
                                style: fontW5S12(context)!.copyWith(
                                    fontSize: 14,
                                    color: AppColors.blackcolor,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.workoutModel.workoutDuration
                                        .toString(),
                                    style: fontW5S12(context)!.copyWith(
                                        fontSize: 14,
                                        color: AppColors.appcolor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Uploaded On",
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 14,
                                color: AppColors.appcolor,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            widget.workoutModel.dateCreated!
                                .toDate()
                                .format("d-M-Y"),
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 11,
                                color: AppColors.blackcolor.withOpacity(0.5),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
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
