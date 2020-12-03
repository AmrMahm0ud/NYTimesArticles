import 'package:flutter/material.dart';
import 'package:ny_times_popular_articles/models/articles_model/articles_model.dart';

class DetailedArticleScreen extends StatefulWidget {
  final ArticleModel articleModel;
  DetailedArticleScreen(this.articleModel);
  @override
  _DetailedArticleScreenState createState() => _DetailedArticleScreenState();
}

class _DetailedArticleScreenState extends State<DetailedArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("NY Times Most Popular"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              widget.articleModel.articleTitle,
              maxLines: 3,
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top :9.0 , right: 9.0 , left: 9.0),
            child: Center(
              child: Container(
                height: 220.0,
                width: 330.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.articleModel.articlePhoto),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2.0 , left: 15.0),
                child: Text(
                  widget.articleModel.articleSource,
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2.0 , right: 15.0),
                child: Text(
                  widget.articleModel.articleSubsection,
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Published Date: ${widget.articleModel.articlePublishedDate}",
              maxLines: 3,
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              widget.articleModel.authorName,
              maxLines: 3,
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
