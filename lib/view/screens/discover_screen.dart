import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                const YGap(70),
                const Text(
                  'Discover',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),
                const YGap(5),
                const Text(
                  'News from all over the world',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                const YGap(20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: const TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        suffixIcon: RotatedBox(
                            quarterTurns: 3,
                            child: Icon(CupertinoIcons.slider_horizontal_3)),
                        hintText: 'search',
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          const YGap(30),
          TabBar(
            controller: _tabController,
            isScrollable: true,
            labelPadding: const EdgeInsets.only(left: 16),
            indicatorPadding: const EdgeInsets.only(left: 16, bottom: -10),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Text('Health',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('Politcis',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('Art',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('Food',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('Science',
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
                    title: 'Shunsui Kakashi called Sasori a red puppet',
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
