import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/sizing.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/view/components/news_listtile.dart';
import 'package:news_app/view/screens/detail_screen.dart';
import 'package:news_app/viewmodel/cubit/news_cubit.dart';
import 'package:provider/src/provider.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    context.read<NewsCubit>().categoryNews(NewsCategory.business);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const YGap(60),
                const Icon(
                  Icons.menu,
                ),
                const YGap(60),
                const Text(
                  'Discover',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const YGap(5),
                const Text(
                  'News from all over the world',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                const YGap(30),
                Container(
                  height: 55,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColor.lightGrey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: const TextField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: AppColor.grey,
                        ),
                        suffixIcon: RotatedBox(
                            quarterTurns: 3,
                            child: Icon(
                              CupertinoIcons.slider_horizontal_3,
                              color: AppColor.grey,
                            )),
                        hintText: 'search',
                        hintStyle: TextStyle(color: AppColor.grey),
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          const YGap(40),
          TabBar(
            controller: _tabController,
            isScrollable: true,
            labelPadding: const EdgeInsets.only(left: 16),
            indicatorPadding: const EdgeInsets.only(left: 16, bottom: -10),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.black,
            labelColor: AppColor.black,
            unselectedLabelColor: AppColor.grey,
            onTap: (index) async {
              switch (index) {
                case 0:
                  await context
                      .read<NewsCubit>()
                      .categoryNews(NewsCategory.business);
                  break;
                case 1:
                  await context
                      .read<NewsCubit>()
                      .categoryNews(NewsCategory.health);
                  break;
                case 2:
                  await context
                      .read<NewsCubit>()
                      .categoryNews(NewsCategory.science);
                  break;
                case 3:
                  await context
                      .read<NewsCubit>()
                      .categoryNews(NewsCategory.sport);
                  break;
                case 4:
                  await context
                      .read<NewsCubit>()
                      .categoryNews(NewsCategory.technology);
                  break;
                default:
                  context.read<NewsCubit>().categoryNews(NewsCategory.business);
              }
            },
            tabs: const [
              Text('Business',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('Health',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('Science',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('Sports',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('Technology',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ],
          ),
          const YGap(10),
          BlocConsumer<NewsCubit, NewsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is NewsLoading) {
                return const Expanded(
                    child: Center(
                        child: SpinKitDoubleBounce(color: AppColor.black)));
              }
              if (state is NewsLoaded) {
                return Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ListView.builder(
                          itemCount: state.news.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      DetailScreen(news: state.news[index]),
                                ));
                              },
                              child: NewsListTile(
                                imageUrl: state.news[index].urlToImage,
                                title: state.news[index].title!,
                                timeAgo: state.news[index].publishedAt!
                                    .fromTimestampToTimeAgo(),
                              ),
                            );
                          }),
                      ListView.builder(
                          itemCount: state.news.length,
                          itemBuilder: (context, index) {
                            return NewsListTile(
                              imageUrl: state.news[index].urlToImage,
                              title: state.news[index].title!,
                              timeAgo: state.news[index].publishedAt!
                                  .fromTimestampToTimeAgo(),
                            );
                          }),
                      ListView.builder(
                          itemCount: state.news.length,
                          itemBuilder: (context, index) {
                            return NewsListTile(
                              imageUrl: state.news[index].urlToImage,
                              title: state.news[index].title!,
                              timeAgo: state.news[index].publishedAt!
                                  .fromTimestampToTimeAgo(),
                            );
                          }),
                      ListView.builder(
                          itemCount: state.news.length,
                          itemBuilder: (context, index) {
                            return NewsListTile(
                              imageUrl: state.news[index].urlToImage,
                              title: state.news[index].title!,
                              timeAgo: state.news[index].publishedAt!
                                  .fromTimestampToTimeAgo(),
                            );
                          }),
                      ListView.builder(
                          itemCount: state.news.length,
                          itemBuilder: (context, index) {
                            return NewsListTile(
                              imageUrl: state.news[index].urlToImage,
                              title: state.news[index].title!,
                              timeAgo: state.news[index].publishedAt!
                                  .fromTimestampToTimeAgo(),
                            );
                          }),
                    ],
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
