import 'package:intl/intl.dart';

String uDateFormat(String date) {
//"2023-05-22 02:23:47",

  var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  var inputDate = inputFormat.parse(date); // <-- dd/MM 24H format

  var outputFormat = DateFormat('dd/MM/yyyy');
  var outputDate = outputFormat.format(inputDate);
  print(outputDate); // 12/31/2000 11:59 PM <-- MM/dd 12H format
  return outputDate;
}

String uTimeFormat(String date) {
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  var inputDate = inputFormat.parse(date); // <-- dd/MM 24H format

  var outputFormat = DateFormat('hh:mm');
  var outputTime = outputFormat.format(inputDate);
  print(outputTime);
  // 12/31/2000 11:59 PM <-- MM/dd 12H format
  return outputTime;
}
