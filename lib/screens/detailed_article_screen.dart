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
        backgroundColor: Color(0xFF45E3C2),
        title: Text("NY Times Most Popular"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                widget.articleModel.articleTitle,
                maxLines: 3,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 9.0, left: 9.0, bottom: 2.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                widget.articleModel.abstractArticle,
                maxLines: 3,
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 9.0, right: 9.0, left: 9.0),
                  child: Text(
                    widget.articleModel.authorName,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9.0, right: 9.0, left: 9.0),
                child: Text(
                  widget.articleModel.articlePublishedDate,
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 9.0, right: 9.0, left: 9.0),
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
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0, left: 15.0),
              child: Text(
                "Source: ${widget.articleModel.articleSource}",
                style: TextStyle(
                  fontSize: 9.0,
                ),
              ),
            ),
          ),
          dummyString(),
        ],
      ),
    );
  }
 ///////////////////////////////////////////
 ////////////////Helper Widgets////////////
 ////////////////////////////////////////

  Widget dummyString(){
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      ),
    );
  }
}
