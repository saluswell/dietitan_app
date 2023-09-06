import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../notificationSection/handlers/notification_handler.dart';

class ZegoSimpleJoinVideoCallPage extends StatefulWidget {
  final String callID;
  final String patientID;
  final String myUserID;

  const ZegoSimpleJoinVideoCallPage({
    Key? key,
    required this.callID,
    required this.patientID,
    required this.myUserID,
  }) : super(key: key);

  @override
  State<ZegoSimpleJoinVideoCallPage> createState() =>
      _ZegoSimpleJoinVideoCallPageState();
}

class _ZegoSimpleJoinVideoCallPageState
    extends State<ZegoSimpleJoinVideoCallPage> {
  @override
  void dispose() {
    NotificationController.cancelNotification(-1);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: 1826079009,
        appSign:
            "68819f495caffa0e72e92a1937c0dd614524e077418d51c6d392a3546e8134cd",
        userID: widget.myUserID,
        userName: "user_${widget.myUserID}",
        callID: widget.callID,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..onOnlySelfInRoom = (context) {
            NotificationController.cancelNotification(-1);
            Navigator.of(context).pop();
          },
      ),
    );
  }
}
