import 'package:intl/intl.dart';

String convertTo12HourFormat(time24) {
  DateTime dateTime = DateTime.parse(time24.substring(0, 19));

  // Use DateFormat to format it into 'hh:mm a'
  String formattedTime = DateFormat('hh:mm a').format(dateTime);

  return formattedTime;
}
