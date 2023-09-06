// import 'package:dietationapp/common/utils/appcolors.dart';
// import 'package:dietationapp/common/utils/themes.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
//
// class CalendarScreen extends StatefulWidget {
//   const CalendarScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CalendarScreen> createState() => _CalendarScreenState();
// }
//
// class _CalendarScreenState extends State<CalendarScreen> {
//   CalendarController _calendarController = CalendarController();
//
//   _AppointmentDataSource _getCalendarDataSource() {
//     List<Appointment> appointments = <Appointment>[];
//     appointments.add(Appointment(
//       startTime: DateTime.now(),
//       endTime: DateTime.now().add(Duration(minutes: 10)),
//       subject: 'Appointment with patient',
//       color: Colors.green,
//       startTimeZone: '',
//       endTimeZone: '',
//     ));
//     appointments.add(Appointment(
//       location: "Kohat",
//       startTime: DateTime(2022, 10, 12, 5, 12),
//       endTime: DateTime.now().add(Duration(minutes: 50)),
//       subject: 'Meeting',
//       color: Colors.green,
//       startTimeZone: '',
//       endTimeZone: '',
//     ));
//     appointments.add(Appointment(
//       location: "Kohat",
//       startTime: DateTime(2022, 10, 16, 5, 12),
//       endTime: DateTime.now().add(Duration(minutes: 50)),
//       subject: 'Meeting',
//       color: Colors.green,
//       startTimeZone: '',
//       endTimeZone: '',
//     ));
//     appointments.add(Appointment(
//       location: "Kohat",
//       startTime: DateTime(2022, 10, 21, 5, 12),
//       endTime: DateTime.now().add(Duration(minutes: 50)),
//       subject: 'Meeting',
//       color: Colors.green,
//       startTimeZone: '',
//       endTimeZone: '',
//     ));
//
//     return _AppointmentDataSource(appointments);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () {
//               Navigator.maybePop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: AppColors.appcolor,
//             ),
//           ),
//           backgroundColor: AppColors.whitecolor,
//           centerTitle: true,
//           title: Text(
//             "Upcoming Appointments",
//             style: fontW5S12(context)!.copyWith(
//                 color: AppColors.blackcolor,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500),
//           ),
//         ),
//         body: Container(
//           child: SfCalendar(
//
//             controller: _calendarController,
//             minDate: DateTime.now(),
//             dataSource: _getCalendarDataSource(),
//             view: CalendarView.schedule,
//             scheduleViewSettings: const ScheduleViewSettings(
//                 appointmentItemHeight: 70,
//                 monthHeaderSettings: MonthHeaderSettings(
//                     monthFormat: 'MMMM, yyyy',
//                     height: 50,
//                     textAlign: TextAlign.center,
//                     backgroundColor: Colors.teal,
//                     monthTextStyle: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400)),
//                 weekHeaderSettings: WeekHeaderSettings(
//                     startDateFormat: 'dd MMM ',
//                     endDateFormat: 'dd MMM, yy',
//                     height: 50,
//                     textAlign: TextAlign.center,
//                     backgroundColor: Colors.blueAccent,
//                     weekTextStyle: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 15,
//                     )),
//                 dayHeaderSettings: DayHeaderSettings(
//                     dayFormat: 'EEEE',
//                     width: 70,
//                     dayTextStyle: TextStyle(
//                       fontSize: 10,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.black,
//                     ),
//                     dateTextStyle: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     )),
//                 hideEmptyScheduleWeek: false,
//                 appointmentTextStyle: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white)),
//             showNavigationArrow: true,
//             todayHighlightColor: Colors.green,
//             allowViewNavigation: true,
//             allowAppointmentResize: true,
//             allowDragAndDrop: true,
//             onDragStart: dragStart,
//             onDragUpdate: dragUpdate,
//             onDragEnd: dragEnd,
//             dragAndDropSettings: const DragAndDropSettings(
//                 allowScroll: true,
//                 indicatorTimeFormat: 'hh:mm',
//                 showTimeIndicator: true,
//                 autoNavigateDelay: Duration(seconds: 1),
//                 allowNavigation: true),
//             // dragAndDropSettings: DragAndDropSettings(
//             //     showTimeIndicator: true,
//             //     allowScroll: true,
//             //     allowNavigation: true,
//             //     autoNavigateDelay: Duration(seconds: 2)),
//             showCurrentTimeIndicator: true,
//             showDatePickerButton: true,
//             showWeekNumber: true,
//             monthViewSettings: const MonthViewSettings(
//                 monthCellStyle: MonthCellStyle(
//               backgroundColor: AppColors.redcolor,
//             )),
//             viewNavigationMode: ViewNavigationMode.snap,
//
//             // loadMoreWidgetBuilder: (BuildContext context,
//             //     LoadMoreCallback loadMoreAppointments) {
//             //   return FutureBuilder (
//             //     initialData: 'loading',
//             //     future: loadMoreAppointments(),
//             //     builder: (context, snapShot) {
//             //       return Container(
//             //           height: _calendarController.view == CalendarView.schedule
//             //               ? 50
//             //               : double.infinity,
//             //           width: double.infinity,
//             //           color: Colors.white38,
//             //           alignment: Alignment.center,
//             //           child: CircularProgressIndicator(
//             //               valueColor:
//             //               AlwaysStoppedAnimation(Colors.deepPurple)));
//             //     },
//             //   );
//             // },
//
//             // timeSlotViewSettings: TimeSlotViewSettings(
//             //
//             //     // startHour: 12,
//             //     // endHour: 12,
//             //     timeInterval: Duration(hours: 1)),
//           ),
//         ));
//   }
//
//   void dragStart(AppointmentDragStartDetails appointmentDragStartDetails) {
//     dynamic appointment = appointmentDragStartDetails.appointment;
//     CalendarResource? resource = appointmentDragStartDetails.resource;
//   }
//
//   void dragUpdate(AppointmentDragUpdateDetails appointmentDragUpdateDetails) {
//     dynamic appointment = appointmentDragUpdateDetails.appointment;
//     DateTime? draggingTime = appointmentDragUpdateDetails.draggingTime;
//     Offset? draggingOffset = appointmentDragUpdateDetails.draggingPosition;
//     CalendarResource? sourceResource =
//         appointmentDragUpdateDetails.sourceResource;
//     CalendarResource? targetResource =
//         appointmentDragUpdateDetails.targetResource;
//   }
//
//   void dragEnd(AppointmentDragEndDetails appointmentDragEndDetails) {
//     dynamic appointment = appointmentDragEndDetails.appointment!;
//     CalendarResource? sourceResource = appointmentDragEndDetails.sourceResource;
//     CalendarResource? targetResource = appointmentDragEndDetails.targetResource;
//     DateTime? droppingTime = appointmentDragEndDetails.droppingTime;
//   }
// }
//
// class _AppointmentDataSource extends CalendarDataSource {
//   _AppointmentDataSource(List<Appointment> source) {
//     appointments = source;
//   }
// }
