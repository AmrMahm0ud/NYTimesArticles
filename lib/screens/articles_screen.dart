import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ny_times_popular_articles/bloc/articles_bloc/articles_bloc.dart';
import 'package:ny_times_popular_articles/bloc/articles_bloc/articles_bloc_event.dart';
import 'package:ny_times_popular_articles/bloc/articles_bloc/articles_bloc_state.dart';
import 'package:ny_times_popular_articles/models/articles_model/articles_model.dart';
import 'package:ny_times_popular_articles/widgets/article_widget.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    super.initState();
    getArticlesData();
  }

  List<ArticleModel> articleDate = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: BlocListener<ArticlesBloc, ArticlesBlocState>(
        listener: (context, state) {
          if (state is ErrorArticlesState) {
            toast("Try Again Later");
          } else if (state is NetworkErrorArticlesState) {
            toast("Check Your Connection");
          } else if (state is ReceivedArticlesState) {
            articleDate = state.receivedArticleDataList;
          }
        },
        child: BlocBuilder<ArticlesBloc, ArticlesBlocState>(
          builder: (context, state) {
            if (state is LoadingArticlesState) {
              return loadingWidget();
            } else if (state is ReceivedArticlesState) {
              return ArticleWidget(state.receivedArticleDataList);
            } else
              return defaultArticlesWidget();
          },
        ),
      ),
    );
  }

  //////////////////////////////////////////
  //////////////Widget/////////////////////
  ////////////////////////////////////////
  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.greenAccent,
      title: Text(
        "NY Times Most Popular",
        style: TextStyle(fontSize: 18.0),
      ),
      leading: GestureDetector(
        onTap: () {},
        child: Icon(Icons.menu),
      ),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            )),
        Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.more_vert),
            )),
      ],
    );
  }

  Widget loadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget defaultArticlesWidget() {
    if (articleDate.length == 0) {
      return Center(
        child: Text("No Articles"),
      );
    } else
      return ArticleWidget(articleDate);
  }

////////////////////////////////////////
//////////////Helper Method/////////////
////////////////////////////////////////

  getArticlesData() {
    BlocProvider.of<ArticlesBloc>(context).add(GetArticlesEvent());
  }

  toast(String content) {
    Fluttertoast.showToast(
        msg: content,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
