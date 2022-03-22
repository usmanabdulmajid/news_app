import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/api/api_client.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:news_app/service/local_db/sql_db.dart';
import 'package:news_app/view/screens/detail_screen.dart';
import 'package:news_app/view/screens/discover_screen.dart';
import 'package:news_app/view/screens/home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  void initState() {
    NewsRepository newsRepository = NewsRepository(ApiClient(), SqlDb());
    newsRepository
        .categoryNews(NewsCategory.health)
        .then((value) => print(value[1].title));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomeScreen(),
          DiscoverScreen(),
          DetailScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
