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
                  right: 35,
                  child: Row(
                    children: [
                      Icon(
                        Icons.date_range_sharp,
                        size: 15,
                      ),
                      Text(articlesDataList[index].articlePublishedDate),
                    ],
                  ),
                ),
                ListTile(
                  leading: ClipOval(
                    child: Image(
                      image: NetworkImage(
                        articlesDataList[index].articlePhoto,
                      ),
                      fit: BoxFit.cover,
                      width: 60,
                      height: 150,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      articlesDataList[index].articleTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(15.0),
                  subtitle: Text(
                    articlesDataList[index].authorName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            onTap: () {
              navToDetailedArticleScreen(context, articlesDataList[index]);
            },
          );
        });

  }

//////////////////////////////////////
//////////////Helper Method///////////
/////////////////////////////////////

  navToDetailedArticleScreen(BuildContext context , ArticleModel articleModel ){
    Navigator.push(context , MaterialPageRoute(builder: (context) => DetailedArticleScreen(articleModel)));
  }
  
}
