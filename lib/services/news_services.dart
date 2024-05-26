import 'dart:convert';
import 'package:http/http.dart' as  http;
import 'package:new_app/models/article_model.dart';
import 'package:new_app/models/news_model.dart';

class RemoteNewsService {
  static Future<List<NewsArticle>> fetchNewsArticles(String category) async {
    final response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=3c88955c487e4d9db668f011dd85e737&category=$category'),
    );

    if (response.statusCode == 200) {
            return newsArticleFromJson(response.body);
    } else {
      throw Exception(
          'API request failed with status code ${response.statusCode}');
    }
  }
}






// class RemoteNewsService {

//   static Future<List<NewsArticle>> fetchNewsArticles(String value) async {

//       http.Response response = await http.get(
//         Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=3c88955c487e4d9db668f011dd85e737'),
//       );
//          print('stauscode${response.body}--${response.statusCode}');

//       if (response.statusCode == 200) {
//         // var decodeData = jsonDecode(response.body);
//         // return Articles.fromJson(decodeData);
//       return newsArticleFromJson(response.body);
//       }
//        else {
//         throw Exception('API request failed with status code ${response.statusCode}');
//       }

//   }
// }






