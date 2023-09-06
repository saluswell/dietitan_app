// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
//
// class SfCalendarScreen extends StatefulWidget {
//   const SfCalendarScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SfCalendarScreen> createState() => _SfCalendarScreenState();
// }
//
// class _SfCalendarScreenState extends State<SfCalendarScreen> {
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
//       body: Column(
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           Container(
//             height: 700,
//             child: SfCalendar(
//               dataSource: _getCalendarDataSource(),
//               blackoutDates: <DateTime>[
//                 DateTime(2022, 11, 10),
//                 DateTime(2022, 11, 15),
//                 DateTime(2022, 11, 20),
//                 DateTime(2020, 08, 22),
//                 DateTime(2020, 08, 24)
//               ],
//               blackoutDatesTextStyle: TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 13,
//                   color: Colors.red,
//                   decoration: TextDecoration.lineThrough),
//               view: CalendarView.month,
//               monthViewSettings: MonthViewSettings(
//                 appointmentDisplayCount: 2,
//                 showAgenda: true,
//                 agendaStyle: AgendaStyle(
//                   backgroundColor: Color(0xFF066cccc),
//                   appointmentTextStyle: TextStyle(
//                       fontSize: 14,
//                       fontStyle: FontStyle.italic,
//                       color: Color(0xFF0ffcc00)),
//                   dateTextStyle: TextStyle(
//                       fontStyle: FontStyle.italic,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w300,
//                       color: Colors.black),
//                   dayTextStyle: TextStyle(
//                       fontStyle: FontStyle.normal,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black),
//                 ),
//                 agendaViewHeight: 300,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _AppointmentDataSource extends CalendarDataSource {
//   _AppointmentDataSource(List<Appointment> source) {
//     appointments = source;
//   }
// }
