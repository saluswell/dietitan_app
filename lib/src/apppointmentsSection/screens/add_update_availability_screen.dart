// import 'dart:developer';
//
// import 'package:flutter/material.dart';
//
// import '../../../common/helperFunctions/showsnackbar.dart';
//
// class AppointmentBookingFlow extends StatefulWidget {
//   static String route = "/AppointmentBookingFlow";
//
//   const AppointmentBookingFlow({Key? key}) : super(key: key);
//
//   @override
//   State<AppointmentBookingFlow> createState() => _AppointmentBookingFlowState();
// }
//
// class _AppointmentBookingFlowState extends State<AppointmentBookingFlow> {
//   DayPartController dayPartController = DayPartController();
//   DateTime selectTime = DateTime.now();
//
//   DateTime? selectedDateVar;
//
//   DateTime? completeDateTime;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 50,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 EasyDateTimeLine(
//                   initialDate: DateTime.now(),
//                   activeColor: AppColors.darkAppColor,
//                   dayProps: EasyDayProps(
//                       inactiveDayDecoration: BoxDecoration(
//                           color: AppColors.appLightColor.withOpacity(0.6),
//                           borderRadius: BorderRadius.circular(13)),
//                       todayHighlightColor: AppColors.pinkColor,
//                       dayStructure: DayStructure.dayStrDayNumMonth,
//                       landScapeMode: false),
//                   headerProps: EasyHeaderProps(
//                       showMonthPicker: true,
//                       monthPickerType: MonthPickerType.switcher,
//                       showHeader: true,
//                       selectedDateFormat:
//                           SelectedDateFormat.fullDateDMonthAsStrY,
//                       showSelectedDate: true),
//                   timeLineProps: EasyTimeLineProps(
//                       backgroundColor: AppColors.whiteColor,
//                       decoration: BoxDecoration()),
//                   onDateChange: (selectedDate) {
//                     dp(msg: "on date change", arg: selectedDate);
//                     setState(() {
//                       selectedDateVar = selectedDate;
//                     });
//                     //[selectedDate] the new date selected.
//                   },
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: TimesSlotGridViewFromInterval(
//                 locale: "en",
//                 initTime: selectTime,
//                 crossAxisCount: 4,
//                 selectedColor: AppColors.darkAppColor,
//                 unSelectedColor: AppColors.appLightColor.withOpacity(0.6),
//                 timeSlotInterval: const TimeSlotInterval(
//                   start: TimeOfDay(hour: 00, minute: 00),
//                   end: TimeOfDay(hour: 24, minute: 0),
//                   interval: Duration(hours: 1, minutes: 0),
//                 ),
//                 onChange: (value) {
//                   setState(() {
//                     selectTime = value;
//                     dp(msg: "selected time", arg: selectTime);
//
//                     completeDateTime = DateTime(
//                         selectedDateVar!.year,
//                         selectedDateVar!.month,
//                         selectedDateVar!.day,
//                         selectTime.hour,
//                         selectTime.minute);
//
//                     dp(
//                         msg: "complete date time",
//                         arg: completeDateTime.toString());
//                   });
//                 },
//               ),
//             ),
//
//             // TimesSlotGridViewFromList(
//             //   locale: "en",
//             //   initTime: selectTime,
//             //   selectedColor: AppColors.appColor,
//             //   crossAxisCount: 4,
//             //   listDates: [
//             //     DateTime(2023, 1, 1, 10, 30),
//             //     DateTime(2023, 1, 1, 11, 30),
//             //     DateTime(2023, 1, 1, 12, 30),
//             //     DateTime(2023, 1, 1, 13, 30),
//             //     DateTime(2023, 1, 1, 14, 30),
//             //     DateTime(2023, 1, 1, 15, 30)
//             //   ],
//             //   onChange: (value) {
//             //     setState(() {
//             //       selectTime = value;
//             //       dp(msg: "selected time", arg: selectTime);
//             //
//             //       completeDateTime = DateTime(
//             //           selectedDateVar!.year,
//             //           selectedDateVar!.month,
//             //           selectedDateVar!.day,
//             //           selectTime.hour,
//             //           selectTime.minute);
//             //
//             //       dp(
//             //           msg: "complete date time",
//             //           arg: completeDateTime.toString());
//             //     });
//             //
//             //     // DateTime completeDatetime = DateTime(
//             //     //     selectedDate!.year,
//             //     //     selectedDate!.month,
//             //     //     selectedDate!.day,
//             //     //     selectTime.hour,
//             //     //     selectTime.minute);
//             //     //
//             //     // dp(msg: "complete date time", arg: completeDatetime.toString());
//             //   },
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
