import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';

class AppSnackbar {
  static void success(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message, style: const TextStyle(color: AppColor.white)),
          backgroundColor: AppColor.black,
          duration: const Duration(milliseconds: 2000),
        ),
      );
  }

  static void failure(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(message, style: const TextStyle(color: AppColor.white)),
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 2000),
      ));
  }
}
