import 'package:jiffy/jiffy.dart';

class DateFormatter {
  static dateFormatter(DateTime dateTime) {
    if (DateTime.now().difference(dateTime).inDays > 2) {
      return Jiffy([dateTime.year, dateTime.month, dateTime.day]).yMMMMd;
    } else {
      return Jiffy("${dateTime.year}/${dateTime.month}/${dateTime.day}",
              "yyyy/MM/dd")
          .add(
              duration: Duration(
            minutes: dateTime.minute,
            hours: dateTime.hour,
          ))
          .fromNow();
    }
  }
}
