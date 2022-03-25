import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/core/utils/app_snackbar.dart';
import 'package:provider/src/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/viewmodel/cubit/news_cubit.dart';

class NewsWebviewScreen extends StatefulWidget {
  final News news;
  NewsWebviewScreen({Key? key, required this.news}) : super(key: key);

  @override
  State<NewsWebviewScreen> createState() => _NewsWebviewScreenState();
}

class _NewsWebviewScreenState extends State<NewsWebviewScreen> {
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewsCubit, NewsState>(
      listener: (context, state) {
        if (state is SuccessfullyBookmark) {
          AppSnackbar.success(context, 'News succesfully bookmarked');
        } else if (state is FailedToBookmark) {
          AppSnackbar.failure(context, 'Failed to bookmark');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News'),
          backgroundColor: AppColor.black,
        ),
        body: Stack(
          children: [
            WebView(
              initialUrl: widget.news.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (url) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
            isLoading
                ? const Center(
                    child: SpinKitDoubleBounce(color: AppColor.black))
                : const SizedBox(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            tooltip: 'Bookmark',
            backgroundColor: AppColor.black,
            child: const Icon(Icons.bookmark_add),
            onPressed: () {
              context.read<NewsCubit>().bookmarkNews(widget.news);
            }),
      ),
    );
  }
}
