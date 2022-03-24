import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/src/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/viewmodel/cubit/news_cubit.dart';

class NewsWebviewScreen extends StatelessWidget {
  final News news;
  NewsWebviewScreen({Key? key, required this.news}) : super(key: key);
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        backgroundColor: AppColor.black,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: news.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (url) {
              isLoading = false;
            },
          ),
          ValueListenableBuilder<bool>(
              valueListenable: ValueNotifier(isLoading),
              builder: (context, value, child) {
                print(value);
                if (value) {
                  return const Center(
                      child: SpinKitDoubleBounce(color: AppColor.black));
                }
                return const SizedBox();
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Bookmark',
          backgroundColor: AppColor.black,
          child: const Icon(Icons.bookmark_add),
          onPressed: () {
            context.read<NewsCubit>().bookmarkNews(news);
          }),
    );
  }
}
