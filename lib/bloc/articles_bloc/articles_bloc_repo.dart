import 'dart:io';

import 'package:ny_times_popular_articles/api_manager/articles_api.dart';
import 'package:ny_times_popular_articles/bloc/articles_bloc/articles_bloc_state.dart';
import 'package:ny_times_popular_articles/models/articles_model/articles_model.dart';

abstract class BaseArticlesRepo {
  Future<ArticlesBlocState> getArticlesData();
}

class ArticlesRepo extends BaseArticlesRepo {
  @override
  Future<ArticlesBlocState> getArticlesData() async {
    ArticlesBlocState articlesBlocState;
    ArticlesApi articlesApi = ArticlesApi();
    List<ArticleModel> receivedArticlesDataList = [];
    try {
      receivedArticlesDataList = await articlesApi.fetchArticlesData();
      articlesBlocState = ReceivedArticlesState(receivedArticlesDataList);
      print(receivedArticlesDataList.length);
    } on SocketException {
      articlesBlocState = NetworkErrorArticlesState();
    } catch (error) {
    print(error);
      articlesBlocState = ErrorArticlesState();

    }
    return articlesBlocState;
  }
}
