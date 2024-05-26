                        /// The complete code ///

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:new_app/models/news_model.dart';
import 'package:new_app/services/news_services.dart';

class NewsController extends GetxController {
  var newsArticles = <NewsArticle>[].obs;
  var filteredNewsArticles = <NewsArticle>[].obs;
  var isLoading = true.obs;
  var selectedCategory = ''.obs;

  @override
  void onInit() {
    fetchArticles(); // Fetch articles for the initial category
    super.onInit();
  }

  void fetchArticles([String category = 'general']) async {
    try {
      isLoading(true);
      var articles = await RemoteNewsService.fetchNewsArticles(category);
      newsArticles.assignAll(articles);
      filteredNewsArticles.assignAll(newsArticles);
      selectedCategory(category);
    } finally {
      isLoading(false);
    }
  }

  void setSelectedCategory(String category) {
    fetchArticles(category);
  }

  void searchNews(String query) {
    filteredNewsArticles.assignAll(
      newsArticles.where(
        (article) =>
            article.title.toLowerCase().contains(query.toLowerCase()) ||
            article.author.toLowerCase().contains(query.toLowerCase()) ||
            article.content.toLowerCase().contains(query.toLowerCase()) ||
            article.description.toLowerCase().contains(query.toLowerCase()),
      ),
    );
  }
}



// import 'package:get/get.dart';
// import 'package:new_app/models/news_model.dart';
// import 'package:new_app/services/news_services.dart';

// class NewsController extends GetxController {
//   var newsArticles = <NewsArticle>[].obs;
//   var filteredNewsArticles = <NewsArticle>[].obs; // New filtered list
//   var isLoading = true.obs;

//   @override
//   void onInit() {
//     fetchArticles();
//     super.onInit();
//   }

//   void fetchArticles() async {
//     try {
//       isLoading(true);
//       var articles = await RemoteNewsService.fetchNewsArticles();
//       newsArticles.assignAll(articles);
//       filteredNewsArticles.assignAll(newsArticles); // Initialize filtered list
//     } finally {
//       isLoading(false);
//     }
//   }

//   void searchNews(String query) {
//     filteredNewsArticles.assignAll(
//       newsArticles.where(
//         (article) =>
//             article.title.toLowerCase().contains(query.toLowerCase()) ||
//             article.author.toLowerCase().contains(query.toLowerCase()),
//       ),
//     );
//   }
// }

// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:new_app/models/news_model.dart';
// import 'package:new_app/services/news_services.dart';

// class NewsController extends GetxController {
//   var newsArticles = <NewsArticle>[].obs;
//   var filteredNewsArticles = <NewsArticle>[].obs;
//   var isLoading = true.obs;

//   @override
//   void onInit() {
//     fetchArticles(); // Pass the desired category as an argument
//     super.onInit();
//   }

//   void fetchArticles() async {
//     try {
//       isLoading(true);
//       var articles = await RemoteNewsService.fetchNewsArticles(); // Pass the category parameter
//       newsArticles.assignAll(articles);
//       filteredNewsArticles.assignAll(newsArticles);
//     } finally {
//       isLoading(false);
//     }
//   }

//   void searchNews(String query) {
//     filteredNewsArticles.assignAll(
//       newsArticles.where(
//         (article) =>
//             article.title.toLowerCase().contains(query.toLowerCase()) ||
//             article.author.toLowerCase().contains(query.toLowerCase()),
//       ),
//     );
//   }
// }

/////////
///
// class NewsController extends GetxController {
//   var newsArticles = <NewsArticle>[].obs;
//   var filteredNewsArticles = <NewsArticle>[].obs;
//   var isLoading = true.obs;
//   var selectedCategory = 'general'.obs; // Default category

//   @override
//   void onInit() {
//     fetchArticles(); // Pass the default category
//     super.onInit();
//   }

//   void fetchArticles() async {
//     try {
//       isLoading(true);
//       var articles =
//           await RemoteNewsService.fetchNewsArticles(selectedCategory.value);
//       newsArticles.assignAll(articles);
//       filteredNewsArticles.assignAll(newsArticles);
//     } finally {
//       isLoading(false);
//     }
//   }

//   void searchNews(String query) {
//     filteredNewsArticles.assignAll(
//       newsArticles.where(
//         (article) =>
//             article.title.toLowerCase().contains(query.toLowerCase()) ||
//             article.author.toLowerCase().contains(query.toLowerCase()) ||
//             article.content.toLowerCase().contains(query.toLowerCase()) ||
//             article.description.toLowerCase().contains(query.toLowerCase()),
//       ),
//     );
//   }

//   void setSelectedCategory(String category) {
//     selectedCategory(category);
//     fetchArticles(); // Fetch articles for the selected category
//   }
// }