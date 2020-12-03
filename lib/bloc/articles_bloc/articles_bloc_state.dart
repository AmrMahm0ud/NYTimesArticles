import 'package:ny_times_popular_articles/models/articles_model/articles_model.dart';

abstract class ArticlesBlocState {}

class ReceivedArticlesState extends ArticlesBlocState {
  List<ArticleModel> receivedArticleDataList;
  ReceivedArticlesState(this.receivedArticleDataList);
}

class LoadingArticlesState extends ArticlesBlocState {}

class NetworkErrorArticlesState extends ArticlesBlocState {}

class ErrorArticlesState extends ArticlesBlocState {}
