import 'package:news_app/model/news.dart';
import 'package:news_app/service/local_db/ilocal_db.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb implements ILocalDd {
  Future<Database> _initializeDb() async {
    String path = join(await getDatabasesPath(), 'NewsDb');
    Database newsDb = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE News(id INTEGER PRIMARY KEY, sourceName TEXT, author TEXT, title TEXT, description TEXT, url TEXT, urlToImage TEXT, publishedAt TEXT, content TEXT, category, bookmark INTEGER)');
      },
    );
    return newsDb;
  }

  late final database = _initializeDb();

  @override
  Future<bool> delete(int id) async {
    final db = await database;
    final result = await db.delete('News', where: 'id = ?', whereArgs: [id]);
    return result != 0;
  }

  @override
  Future<List<News>> fetch({NewsCategory? category}) async {
    final db = await database;
    List<News> news = [];
    if (category == null) {
      final results =
          await db.query('News', where: 'bookmark = ?', whereArgs: [1]);
      for (var result in results) {
        news.add(News.fromMap(result));
      }
      return news;
    }
    final results = await db
        .query('News', where: 'category = ?', whereArgs: [category.name]);
    for (var result in results) {
      news.add(News.fromMap(result));
    }
    return news;
  }

  @override
  Future<bool> save(News news) async {
    final db = await database;
    final result = await db.insert('News', news.toMap());

    return result != 0;
  }

  @override
  Future<bool> update(News news) async {
    final db = await database;
    final result = await db
        .update('News', news.toMap(), where: 'id = ?', whereArgs: [news.id]);
    return result != 0;
  }

  @override
  Future<List<News>> fetchAll() async {
    final db = await database;
    final result = await db.query('News');
    return result.map((e) => News.fromMap(e)).toList();
  }
}
