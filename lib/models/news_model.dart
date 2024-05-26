import 'dart:convert';

List<NewsArticle> newsArticleFromJson(String str) => List<NewsArticle>.from(
json.decode(str)['articles'].map((x) => NewsArticle.fromJson(x)));

class NewsArticle {
Source source;
String author;
String title;
String description;
String url;
String urlToImage;
DateTime publishedAt;
String content;

NewsArticle({
required this.source,
required this.author,
required this.title,
required this.description,
required this.url,
required this.urlToImage,
required this.publishedAt,
required this.content,
});

factory NewsArticle.fromJson(Map<String, dynamic> json) => NewsArticle(
source: Source.fromJson(json["source"]),
author: json["author"] ?? "",
title: json["title"] ?? "",
description: json["description"] ?? "",
url: json["url"] ?? "",
urlToImage: json["urlToImage"] ?? "",
publishedAt: DateTime.parse(json["publishedAt"]),
content: json["content"] ?? "",
);
}

class Source {
String id;
String name;

Source({
required this.id,
required this.name,
});

factory Source.fromJson(Map<String, dynamic> json) => Source(
id: json["id"] ?? "",
name: json["name"] ?? "",
);
}



// import 'dart:convert';

// List<Articles> newsArticleFromJson(String str) => List<Articles>.from(json
//     .decode(str)['articles']
//     .map((x) => Articles.fromJson(Map<String, dynamic>.from(x))));
// class Articles {
//   Source? source;
//   String? author;
//   String? title;
//   String? description;
//   String? url;
//   String? urlToImage;
//   String? publishedAt;
//   String? content;

//   Articles(
//       {this.source,
//       this.author,
//       this.title,
//       this.description,
//       this.url,
//       this.urlToImage,
//       this.publishedAt,
//       this.content});

//   Articles.fromJson(Map<String, dynamic> json) {
//     source =
//         json['source'] != null ? new Source.fromJson(json['source']) : null;
//     author = json['author'];
//     title = json['title'];
//     description = json['description'];
//     url = json['url'];
//     urlToImage = json['urlToImage'];
//     publishedAt = json['publishedAt'];
//     content = json['content'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.source != null) {
//       data['source'] = this.source!.toJson();
//     }
//     data['author'] = this.author;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['url'] = this.url;
//     data['urlToImage'] = this.urlToImage;
//     data['publishedAt'] = this.publishedAt;
//     data['content'] = this.content;
//     return data;
//   }
// }

// class Source {
//   String? id;
//   String? name;

//   Source({this.id, this.name});

//   Source.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

// import 'dart:convert';

// List<NewsArticle> newsArticleFromJson(String str) => List<NewsArticle>.from(json
//     .decode(str)['articles']
//     .map((x) => NewsArticle.fromJson(Map<String, dynamic>.from(x))));

// class NewsArticle {
//   Source source;
//   String? author;
//   String title;
//   String? description;
//   String url;
//   String? urlToImage;
//   DateTime publishedAt;
//  String? content;

//   NewsArticle({
//     required this.source,
//     this.author,
//     required this.title,
//     required this.description,
//     required this.url,
//     this.urlToImage,
//     required this.publishedAt,
//      required this.content,
//   });

//   factory NewsArticle.fromJson(Map<String, dynamic> json) => NewsArticle(
//         source: Source.fromJson(json["source"]),
//         author: json["author"],
//         title: json["title"],
//         description: json["description"],
//         url: json["url"],
//         urlToImage: json["urlToImage"],
//         publishedAt: DateTime.parse(json["publishedAt"]), 
        
//        content: json["content"],
//       );
// }

// class Source {
//   dynamic id;
//   String name;

//   Source({
//     this.id,
//     required this.name,
//   });

//   factory Source.fromJson(Map<String, dynamic> json) => Source(
//         id: json["id"],
//         name: json["name"],
//       );
// }
