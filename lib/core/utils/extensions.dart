import 'package:flutter/cupertino.dart';

extension BuildContextExtensions on BuildContext {
  double screenHeight([double percent = 1]) => percent * _height;
  double screenWidth([double percent = 1]) => percent * _width;
  double get _height => MediaQuery.of(this).size.height;
  double get _width => MediaQuery.of(this).size.width;
}

extension StringExtensions on String {
  String fromTimestampToTimeAgo([bool numericDates = true]) {
    final dataTime = DateTime.parse(this);
    final now = DateTime.now();
    final difference = now.difference(dataTime);
    if ((difference.inDays / 365).floor() >= 2) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if ((difference.inDays / 365).floor() >= 1) {
      return (numericDates) ? '1 year ago' : 'Last year';
    } else if ((difference.inDays / 30).floor() >= 2) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return (numericDates) ? '1 month ago' : 'Last month';
    } else if ((difference.inDays / 7).floor() >= 2) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  String fromTimestampToHour() {
    final dataTime = DateTime.parse(this);
    final now = DateTime.now();
    final difference = now.difference(dataTime);
    if (difference.inDays >= 2) {
      return '${difference.inDays} days';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays} d';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} h';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} m';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inMinutes} sec';
    } else {
      return 'now';
    }
  }
}
