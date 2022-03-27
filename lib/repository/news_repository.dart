import 'dart:convert';

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
  Future<List<News>> headlines() async {
    List<News> news = await localDd.fetch(category: NewsCategory.headlines);
    if (news.isEmpty) {
      try {
        final apiResult = await api(uri: 'country=us${ApiConstants.apiKey}');
        final result = jsonDecode(apiResult);
        final articles = result['articles'] as List;
        news = articles.map((e) => News.fromJson(e)).toList();
        for (var each in news) {
          each.category = NewsCategory.headlines;
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
            await api(uri: 'country=us&${category.name}${ApiConstants.apiKey}');
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

  @override
  Future<bool> refresh() async {
    final news = await localDd.fetchAll();
    for (var each in news) {
      if (!each.bookmark ||
          (!each.bookmark && each.category == NewsCategory.headlines)) {
        print(each.category);
        localDd.delete(each.id!);
      }
    }
    var xx = await headlines();
    return true;
  }
}
