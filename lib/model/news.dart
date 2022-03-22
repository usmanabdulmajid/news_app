enum NewsCategory {
  business,
  entertainment,
  general,
  health,
  science,
  sport,
  technology,
  none
}

extension ParseEnum on NewsCategory {
  static NewsCategory enumParsing(String value) =>
      NewsCategory.values.where((element) => element.name == value).first;
}

class News {
  final int? id;
  final String? sourceName;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  NewsCategory? category;
  bool bookmark;

  News(
      {this.id,
      this.sourceName,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.category = NewsCategory.none,
      this.bookmark = false});
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      sourceName: json['source']['name'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
        id: map['id'],
        sourceName: map['sourceName'],
        author: map['author'],
        title: map['title'],
        description: map['description'],
        url: map['url'],
        urlToImage: map['urlToImage'],
        publishedAt: map['publishedAt'],
        content: map['content'],
        category: ParseEnum.enumParsing(map['category']),
        bookmark: map['bookmark'] == 1 ? true : false);
  }

  Map<String, dynamic> toMap() {
    return {
      'sourceName': sourceName,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
      'category': category?.name,
      'bookmark': bookmark ? 1 : 0,
    };
  }
}
