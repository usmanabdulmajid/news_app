import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/api/api_client.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:news_app/service/local_db/sql_db.dart';
import 'package:news_app/view/screens/bookmark_screen.dart';
import 'package:news_app/view/screens/detail_screen.dart';
import 'package:news_app/view/screens/discover_screen.dart';
import 'package:news_app/view/screens/home_screen.dart';
import 'package:news_app/viewmodel/cubit/news_cubit.dart';
import 'package:provider/src/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const [HomeScreen(), DiscoverScreen(), BookmarkScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (index) async {
          if (index == 2) {
            await context.read<NewsCubit>().bookmarks();
          }
          controller.jumpToPage(index);

          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
