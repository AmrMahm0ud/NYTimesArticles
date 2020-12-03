import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_popular_articles/bloc/articles_bloc/articles_bloc_event.dart';
import 'package:ny_times_popular_articles/bloc/articles_bloc/articles_bloc_repo.dart';
import 'package:ny_times_popular_articles/bloc/articles_bloc/articles_bloc_state.dart';

class ArticlesBloc extends Bloc<ArticlesBlocEvent, ArticlesBlocState> {
  final BaseArticlesRepo baseArticlesRepo;
  ArticlesBloc(this.baseArticlesRepo) : super(LoadingArticlesState());

  @override
  Stream<ArticlesBlocState> mapEventToState(ArticlesBlocEvent event) async* {
    if (event is GetArticlesEvent) {
      yield LoadingArticlesState();
      yield await baseArticlesRepo.getArticlesData();
    }
  }
}
