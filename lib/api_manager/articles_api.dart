import "dart:convert";

import 'package:http/http.dart' as http;
import 'package:ny_times_popular_articles/models/articles_model/articles_model.dart';

class ArticlesApi {
  Future<List<ArticleModel>> fetchArticlesData() async {
    List<ArticleModel> loadedArticlesModel = [];
    try {
      final String url =
          "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=gFRTIQwAwAAgVvVemuXAprEFLTSs5hEG";
      final responseArticleAPI = await http.get(url);
      final extractedArticlesDate =
          (json.decode(responseArticleAPI.body))['results'] as List<dynamic>;
      extractedArticlesDate.forEach((element) {
        loadedArticlesModel.add(ArticleModel.fromMap(element as Map<String , dynamic>));
      });
      return loadedArticlesModel;
    } catch (error) {
      throw error;
    }
  }
}
