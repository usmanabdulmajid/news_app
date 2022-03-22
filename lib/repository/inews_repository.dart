import 'package:news_app/model/news.dart';

abstract class INewsRepository {
  Future<List<News>> topHeadlines();
  Future<List<News>> categoryNews(NewsCategory category);
  Future<bool> bookmark(News news);
  Future<List<News>> bookmarks();
  Future<bool> removeBookmark(int id);
}
