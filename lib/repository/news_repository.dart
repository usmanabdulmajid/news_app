import 'dart:convert';
import 'dart:math';

import 'package:news_app/core/api/api_client.dart';
import 'package:news_app/core/api/api_constants.dart';
import 'package:news_app/core/exception/api_exception.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/repository/inews_repository.dart';
import 'package:news_app/service/local_db/ilocal_db.dart';

class NewsRepository implements INewsRepository {
  final ApiClient api;
  final ILocalDd localDd;
  NewsRepository(this.api, this.localDd);

  @override
  Future<List<News>> topHeadlines() async {
    List<News> news = await localDd.fetch(category: NewsCategory.none);
    if (news.isEmpty) {
      try {
        final apiResult = await api(uri: 'country=us${ApiConstants.apiKey}');
        final result = jsonDecode(apiResult);
        final articles = result['articles'] as List;
        news = articles.map((e) => News.fromJson(e)).toList();
        for (var each in news) {
          each.category = NewsCategory.none;
          await localDd.save(each);
        }
      } on NetwrokException {
        throw NetwrokException();
      } on InvalidFormatException {
        throw InvalidFormatException();
      } catch (e) {
        throw Exception(e);
      }
    }
    if (news.isEmpty) {
      throw NoDataException();
    }
    return news;
  }

  @override
  Future<List<News>> categoryNews(NewsCategory category) async {
    List<News> news = await localDd.fetch(category: category);
    if (news.isEmpty) {
      try {
        final apiResult =
            await api(uri: 'country=ng&${category.name}${ApiConstants.apiKey}');
        final result = jsonDecode(apiResult);
        final articles = result['articles'] as List;
        news = articles.map((e) => News.fromJson(e)).toList();
        for (var each in news) {
          each.category = category;
          await localDd.save(each);
        }
      } on NetwrokException {
        throw NetwrokException();
      } on InvalidFormatException {
        throw InvalidFormatException();
      } catch (e) {
        throw Exception(e);
      }
    }
    if (news.isEmpty) {
      throw NoDataException();
    }
    return news;
  }

  @override
  Future<bool> bookmark(News news) async {
    news.bookmark = true;
    final result = await localDd.update(news);
    return result;
  }

  @override
  Future<List<News>> bookmarks() async {
    final result = await localDd.fetch();
    return result;
  }

  @override
  Future<bool> removeBookmark(int id) async {
    final result = await localDd.delete(id);
    return result;
  }
}
