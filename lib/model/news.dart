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
  static NewsCategory enumParsing(String value) {
    return NewsCategory.values.where((element) => element.name == value).first;
  }
}

class News {
  final String? sourceName;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  final NewsCategory? category;

  News(
      {this.sourceName,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.category = NewsCategory.none});
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
        sourceName: map['sourceName'],
        author: map['author'],
        title: map['title'],
        description: map['description'],
        url: map['url'],
        urlToImage: map['urlToImage'],
        publishedAt: map['publishedAt'],
        content: map['content'],
        category: ParseEnum.enumParsing(map['content']));
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
    };
  }
}
