import 'package:intl/intl.dart';

String getRelativeTime(String publishDate, String publishTime) {
  // Gabungkan tanggal dan waktu menjadi format yang dapat di-parse
  String dateTimeString = "$publishDate $publishTime";

  // Format dari tanggal dan waktu
  DateFormat formatter = DateFormat("yyyy-MM-dd hh:mm a");

  // Parse string menjadi DateTime
  DateTime publishDateTime = formatter.parse(dateTimeString);

  // Hitung selisih waktu
  DateTime now = DateTime.now();
  Duration difference = now.difference(publishDateTime);

  if (difference.inDays >= 1) {
    return "${difference.inDays} days ago";
  } else if (difference.inHours >= 1) {
    return "${difference.inHours} hours ago";
  } else if (difference.inMinutes >= 1) {
    return "${difference.inMinutes} minutes ago";
  } else {
    return "just now";
  }
}
