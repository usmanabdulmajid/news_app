import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/sizing.dart';
import 'package:news_app/view/components/news_listtile.dart';

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
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const BouncingScrollPhysics(),
              children: [
                ListView.builder(itemBuilder: (context, index) {
                  return const NewsListTile(
                    imageUrl: 'images/zag.jpg',
                    title: 'Hatake Kakashi called Sasori a red puppet',
                    timeAgo: '4 hours ago',
                  );
                }),
                ListView.builder(itemBuilder: (context, index) {
                  return const NewsListTile(
                    imageUrl: 'images/job.jpg',
                    title: 'Hatake Kakashi called Sasori a red puppet',
                    timeAgo: '4 hours ago',
                  );
                }),
                ListView.builder(itemBuilder: (context, index) {
                  return const NewsListTile(
                    imageUrl: 'images/zag.jpg',
                    title: 'Hatake Kakashi called Sasori a red puppet',
                    timeAgo: '4 hours ago',
                  );
                }),
                ListView.builder(itemBuilder: (context, index) {
                  return const NewsListTile(
                    imageUrl: 'images/zag.jpg',
                    title: 'Shunsui Kakashi called Sasori a red puppet',
                    timeAgo: '4 hours ago',
                  );
                }),
                ListView.builder(itemBuilder: (context, index) {
                  return const NewsListTile(
                    imageUrl: 'images/zag.jpg',
                    title: 'Shunsui Kakashi called Sasori a red puppet',
                    timeAgo: '4 hours ago',
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
