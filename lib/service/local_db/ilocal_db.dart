import 'package:news_app/model/news.dart';

abstract class ILocalDd {
  Future<void> saveNews(List<News> news);
  Future<List<News>> news(String category);
  Future<void> bookmark(News news);
  Future<List<News>> bookmarks();
}
