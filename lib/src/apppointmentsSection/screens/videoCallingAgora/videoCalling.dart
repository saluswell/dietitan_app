// // import 'dart:async';
// // import 'package:flutter/material.dart';
// // import 'package:agora_rtc_engine/rtc_engine.dart';
// // import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
// // import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
// // import 'package:permission_handler/permission_handler.dart';
//
// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../main.dart';
//
// const appid = "59f0edecb3554a399296eaa4c443f863";
// const token =
//     "007eJxTYOhhE5t7KfuZ3TFeIUG2Wc43ywXOh4Youf5zDTmx+87KGfkKDKaWaQapKanJScampiaJxpaWRpZmqYmJJskmJsZpFmbGwklFyQ2BjAw+L4+xMDJAIIjPwlCSWlzCwAAA0M0eKQ==";
//
// // Instantiate the client
// final AgoraClient client = AgoraClient(
//   enabledPermission: [Permission.camera, Permission.microphone],
//   agoraConnectionData: AgoraConnectionData(
//     appId: appid,
//     // rtmEnabled: true,
//
//     tempToken:
//         "007eJxTYOhhE5t7KfuZ3TFeIUG2Wc43ywXOh4Youf5zDTmx+87KGfkKDKaWaQapKanJScampiaJxpaWRpZmqYmJJskmJsZpFmbGwklFyQ2BjAw+L4+xMDJAIIjPwlCSWlzCwAAA0M0eKQ==",
//     channelName: "test",
//   ),
// );
//
// class VideoCallingScreen extends StatefulWidget {
//   const VideoCallingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<VideoCallingScreen> createState() => _VideoCallingScreenState();
// }
//
// class _VideoCallingScreenState extends State<VideoCallingScreen> {
//   @override
//   void initState() {
//     initAgora();
//     super.initState();
//   }
//
//   void initAgora() async {
//     await client.initialize();
//   }
//
//   @override
//   void dispose() {
//     client.engine.destroy();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             AgoraVideoViewer(
//                 layoutType: Layout.floating,
//                 enableHostControls: true,
//                 //  showAVState: true,
//                 showNumberOfUsers: true,
//                 videoRenderMode: VideoRenderMode.Hidden,
//                 client: client),
//             AgoraVideoButtons(
//                 onDisconnect: () {
//                   Navigator.maybePop(context);
//                 },
//                 enabledButtons: const [
//                   BuiltInButtons.toggleCamera,
//                   BuiltInButtons.switchCamera,
//                   BuiltInButtons.callEnd,
//                   BuiltInButtons.toggleMic,
//                 ],
//                 client: client),
//           ],
//         ),
//       ),
//     );
//   }
// }
