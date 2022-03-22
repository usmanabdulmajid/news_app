import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

// ignore: prefer_function_declarations_over_variables
final logger = (Type type) => Logger(printer: AppLogger(type.toString()));

class AppLogger extends LogPrinter {
  final String className;
  AppLogger(this.className);
  @override
  List<String> log(LogEvent event) {
    if (kReleaseMode) {
      return [];
    }
    final color = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    final message = event.message;

    return [color!('$emoji : $className --> $message')];
  }
}
