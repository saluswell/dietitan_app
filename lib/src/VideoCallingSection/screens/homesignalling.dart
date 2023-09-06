// import 'dart:math' as math;
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_styled_toast/flutter_styled_toast.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
//
// final String localUserID = math.Random().nextInt(10000).toString();
//
// class HomeSignalling extends StatefulWidget {
//   final String patientID;
//   final String myID;
//
//   const HomeSignalling({Key? key, required this.patientID, required this.myID})
//       : super(key: key);
//
//   @override
//   State<HomeSignalling> createState() => _HomeSignallingState();
// }
//
// class _HomeSignallingState extends State<HomeSignalling> {
//   final TextEditingController inviteeUsersIDTextCtrl = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return ZegoUIKitPrebuiltCallInvitationService(
//       appID: 1826079009,
//       appSign:
//           "68819f495caffa0e72e92a1937c0dd614524e077418d51c6d392a3546e8134cd",
//       userID: widget.myID,
//       userName: "user_${widget.myID}",
//       plugins: [ZegoUIKitSignalingPlugin()],
//       child: yourPage(context),
//     );
//   }
//
//   Widget yourPage(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: SafeArea(
//         child: Scaffold(
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Your userID: ${widget.myID}'),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(width: 10),
//                   inviteeUserIDInput(),
//                   const SizedBox(width: 5),
//                   callButton(false),
//                   const SizedBox(width: 5),
//                   callButton(true),
//                   const SizedBox(width: 10),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget inviteeUserIDInput() {
//     return Expanded(
//       child: TextFormField(
//         controller: inviteeUsersIDTextCtrl,
//         inputFormatters: [
//           FilteringTextInputFormatter.allow(RegExp('[0-9,]')),
//         ],
//         decoration: const InputDecoration(
//           isDense: true,
//           hintText: "Please Enter Invitees ID",
//           labelText: "Invitees ID, Separate ids by ','",
//         ),
//       ),
//     );
//   }
//
//   Widget callButton(bool isVideoCall) {
//     return ValueListenableBuilder<TextEditingValue>(
//       valueListenable: inviteeUsersIDTextCtrl,
//       builder: (context, inviteeUserID, _) {
//         var invitees = getInvitesFromTextCtrl(widget.patientID);
//
//         return ZegoStartCallInvitationButton(
//           isVideoCall: isVideoCall,
//           invitees: invitees,
//           iconSize: const Size(40, 40),
//           buttonSize: const Size(50, 50),
//           onPressed: (String code, String message, List<String> errorInvitees) {
//             if (errorInvitees.isNotEmpty) {
//               String userIDs = "";
//               for (int index = 0; index < errorInvitees.length; index++) {
//                 if (index >= 5) {
//                   userIDs += '... ';
//                   break;
//                 }
//
//                 var userID = errorInvitees.elementAt(index);
//                 userIDs += userID + ' ';
//               }
//               if (userIDs.isNotEmpty) {
//                 userIDs = userIDs.substring(0, userIDs.length - 1);
//               }
//
//               var message = 'User doesn\'t exist or is offline: $userIDs';
//               if (code.isNotEmpty) {
//                 message += ', code: $code, message:$message';
//               }
//               showToast(
//                 message,
//                 position: StyledToastPosition.top,
//                 context: context,
//               );
//             } else if (code.isNotEmpty) {
//               showToast(
//                 'code: $code, message:$message',
//                 position: StyledToastPosition.top,
//                 context: context,
//               );
//             }
//           },
//         );
//       },
//     );
//   }
//
//   List<ZegoUIKitUser> getInvitesFromTextCtrl(String textCtrlText) {
//     List<ZegoUIKitUser> invitees = [];
//
//     var inviteeIDs = textCtrlText.trim().replaceAll('，', '');
//     inviteeIDs.split(",").forEach((inviteeUserID) {
//       if (inviteeUserID.isEmpty) {
//         return;
//       }
//
//       invitees.add(ZegoUIKitUser(
//         id: inviteeUserID,
//         name: 'user_$inviteeUserID',
//       ));
//     });
//
//     return invitees;
//   }
// }
