// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//
// import '../../../common/utils/appcolors.dart';
// import '../../../common/utils/themes.dart';
//
// class TestWorkWeekCalendar extends StatelessWidget {
//   const TestWorkWeekCalendar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 100,
//           ),
//
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(13)),
//               color: AppColors.whitecolor,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SfDateRangePicker(
//                   headerStyle: DateRangePickerHeaderStyle(
//                       backgroundColor: AppColors.appcolor.withOpacity(0.9),
//                       textAlign: TextAlign.center,
//                       textStyle: fontW4S12(context)!
//                           .copyWith(fontSize: 17, color: AppColors.whitecolor)),
//                   headerHeight: 50,
//
//                   //   controller: _datePickerController,
//                   enablePastDates: false,
//                   enableMultiView: false,
//
//                   showNavigationArrow: true,
//                   minDate: DateTime.now(),
//                   viewSpacing: 20,
//
//                   // monthViewSettings:
//                   //     DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
//                   //  onSelectionChanged: _onSelectionChanged,
//                   navigationDirection:
//                       DateRangePickerNavigationDirection.horizontal,
//                   selectionMode: DateRangePickerSelectionMode.multiple,
//                   startRangeSelectionColor: AppColors.appcolor,
//                   endRangeSelectionColor: AppColors.appcolor,
//                   todayHighlightColor: AppColors.appcolor,
//
//                   //showActionButtons: true,
//                   //allowViewNavigation: false,
//                   view: DateRangePickerView.month,
//                   selectionRadius: 17,
//                   rangeSelectionColor: AppColors.appcolor.withOpacity(0.3),
//                   selectionShape: DateRangePickerSelectionShape.rectangle,
//                   selectionColor: AppColors.appcolor,
//                   monthViewSettings: const DateRangePickerMonthViewSettings(
//                     // showWeekNumber: true,
//                     enableSwipeSelection: false,
//                     weekNumberStyle: DateRangePickerWeekNumberStyle(
//                         textStyle: TextStyle(color: AppColors.redcolor)),
//                     firstDayOfWeek: 1,
//                     showTrailingAndLeadingDates: true,
//                     dayFormat: 'EE',
//                     viewHeaderStyle: DateRangePickerViewHeaderStyle(
//
//                         //    backgroundColor: Color(0xFF7fcd91),
//                         textStyle: TextStyle(
//                             color: AppColors.blackcolor,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 14,
//                             letterSpacing: 5)),
//
//                     //  numberOfWeeksInView: 1
//                   ),
//                   toggleDaySelection: true,
//
//                   //showTodayButton: true,
//                   //   showActionButtons: ,
//                 ),
//               ),
//             ),
//           ),
//
//           // SfDateRangePicker(
//           //   view: DateRangePickerView.month,
//           //   selectionMode: DateRangePickerSelectionMode.range,
//           //  // enableMultiView: true,
//           // )
//           // // SfCalendar(
//           // //   view: CalendarView.workWeek,
//           // //   timeSlotViewSettings: TimeSlotViewSettings(
//           // //       minimumAppointmentDuration: Duration(hours: 1),
//           // //       numberOfDaysInView: 30,
//           // //       timeRulerSize: 50,
//           // //       startHour: 9,
//           // //       endHour: 16,
//           // //       nonWorkingDays: <int>[DateTime.friday, DateTime.saturday]),
//           // // ),
//         ],
//       ),
//     );
//   }
// }
