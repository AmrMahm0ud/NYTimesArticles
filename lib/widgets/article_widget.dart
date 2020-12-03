import 'package:flutter/material.dart';

import 'package:ny_times_popular_articles/models/articles_model/articles_model.dart';
import 'package:ny_times_popular_articles/screens/detailed_article_screen.dart';

class ArticleWidget extends StatelessWidget {
  final List<ArticleModel> articlesDataList;
  ArticleWidget(this.articlesDataList);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articlesDataList.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Stack(
              children: [
                Positioned(
                  bottom: 3,
                  right: 70,
                  child: Row(
                    children: [
                      Icon(
                        Icons.date_range_sharp,
                        size: 15,
                        color: Colors.grey,
                      ),
                      Text(
                        articlesDataList[index].articlePublishedDate,
                        style: TextStyle(fontSize: 11.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                articleListTile(
                    articlesDataList[index].articlePhoto,
                    articlesDataList[index].articleTitle,
                    articlesDataList[index].authorName) as Widget,
              ],
            ),
            onTap: () {
              navToDetailedArticleScreen(context, articlesDataList[index]);
            },
          );
        });
  }
  /////////////////////////////////////
  //////////////Widgets////////////////
  ////////////////////////////////////

  articleListTile(String articlePhoto, String articleTitle, String authorName) {
    return ListTile(
      leading: ClipOval(
        child: Image(
          image: NetworkImage(
            articlePhoto,
          ),
          fit: BoxFit.cover,
          width: 60,
          height: 60,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios_outlined),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Text(
          articleTitle,
          style: TextStyle(fontSize: 13.0),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      contentPadding: EdgeInsets.all(15.0),
      subtitle: Text(
        authorName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.grey, fontSize: 12.0),
      ),
    );
  }

//////////////////////////////////////
//////////////Helper Method///////////
/////////////////////////////////////

  navToDetailedArticleScreen(BuildContext context, ArticleModel articleModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailedArticleScreen(articleModel)));
  }
}
