// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
// import 'package:flutter/material.dart';
//
// class ZegoCloudWidget extends StatelessWidget {
//   const ZegoCloudWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ZegoUIKitPrebuiltCallInvitationService(
//         appID: 1826079009,
//
//         //  serverSecret: yourServerSecret,
//         appSign:
//             "68819f495caffa0e72e92a1937c0dd614524e077418d51c6d392a3546e8134cd",
//         userID: "11",
//         userName: "sohaib",
//         plugins: [ZegoUIKitSignalingPlugin()],
//         requireConfig: (ZegoCallInvitationData data) {
//           late ZegoUIKitPrebuiltCallConfig config;
//
//           if (data.invitees.length > 1) {
//             ///  group call
//             config = ZegoInvitationType.videoCall == data.type
//                 ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
//                 : ZegoUIKitPrebuiltCallConfig.groupVoiceCall();
//           } else {
//             ///  one on one call
//             config = ZegoInvitationType.videoCall == data.type
//                 ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
//                 : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();
//
//             config.onHangUp = () {
//               Navigator.of(context).pop();
//             };
//           }
//
//           return config;
//         },
//         child: Text(""));
//   }
// }
