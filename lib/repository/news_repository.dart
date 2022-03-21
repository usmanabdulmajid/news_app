import 'dart:convert';

import 'package:news_app/core/api/api_client.dart';
import 'package:news_app/core/api/api_constants.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/repository/inews_repository.dart';
import 'package:news_app/service/local_db/ilocal_db.dart';

class NewsRepository implements INewsRepository {
  final ApiClient api;
  NewsRepository(this.api);

  @override
  Future<List<News>> topHeadlines() async {
    List<News> news = [];
    try {
      final apiResult = await api(uri: 'country=us${ApiConstants.apiKey}');
      final result = jsonDecode(apiResult);
      final articles = result['articles'] as List;
      news = articles.map((e) => News.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
    return news;
  }

  @override
  Future<List<News>> categoryNews(NewsCategory category) async {
    List<News> news = [];
    try {
      final apiResult =
          await api(uri: 'country=ng&${category.name}${ApiConstants.apiKey}');
      final result = jsonDecode(apiResult);
      final articles = result['articles'] as List;
      news = articles.map((e) => News.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
    return news;
  }
}
