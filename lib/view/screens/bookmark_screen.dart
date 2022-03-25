import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/app_snackbar.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/view/components/news_listtile.dart';
import 'package:news_app/viewmodel/cubit/news_cubit.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().bookmarks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          if (state is SuccessfullyRemovedBookmark) {
            AppSnackbar.success(context, 'Succesfully removed bookmark');
          } else if (state is FailedToRemoveBookmark) {
            AppSnackbar.failure(context, 'Failed to remove bookmark');
          }
        },
        builder: (context, state) {
          if (state is NoNewsData) {
            return const Center(
                child: Text('No Bookmarks',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)));
          }
          if (state is NewsLoading) {
            return const Center(
                child: SpinKitDoubleBounce(color: AppColor.black));
          }
          return ListView.separated(
              padding: const EdgeInsets.only(top: 60),
              itemBuilder: (context, index) {
                var news = state as NewsLoaded;
                return NewsListTile(
                    title: news.news[index].title,
                    imageUrl: news.news[index].urlToImage,
                    timeAgo:
                        news.news[index].publishedAt!.fromTimestampToTimeAgo(),
                    bookmark: true,
                    onBookark: () async {
                      print('object');
                      await context
                          .read<NewsCubit>()
                          .removeFromBookmark(news.news[index].id!);
                    });
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: state is NewsLoaded ? state.news.length : 0);
        },
      ),
    );
  }
}
