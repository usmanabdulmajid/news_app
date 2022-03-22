import 'package:news_app/model/news.dart';

abstract class ILocalDd {
  Future<bool> save(News news);
  Future<bool> update(News news);
  Future<bool> delete(int id);
  Future<List<News>> fetch({NewsCategory? category});
}
