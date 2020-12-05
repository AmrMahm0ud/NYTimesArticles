import "dart:convert";

import 'package:http/http.dart' as http;
import 'package:ny_times_popular_articles/models/articles_model/articles_model.dart';

class ArticlesApi {
  Future<List<ArticleModel>> fetchArticlesData() async {
    const String period = "7" ;
    const String APIkey = "gFRTIQwAwAAgVvVemuXAprEFLTSs5hEG" ;
    List<ArticleModel> loadedArticlesModel = [];
    try {
      const String url =
          "https://api.nytimes.com/svc/mostpopular/v2/viewed/${period}.json?api-key=${APIkey}";
      final responseArticleAPI = await http.get(url);
      final extractedArticlesData =
          (json.decode(responseArticleAPI.body))['results'] as List<dynamic>;
      extractedArticlesData.forEach((element) {
        loadedArticlesModel
            .add(ArticleModel.fromMap(element as Map<String, dynamic>));
      });
      return loadedArticlesModel;
    } catch (error) {
      throw error;
    }
  }
}
