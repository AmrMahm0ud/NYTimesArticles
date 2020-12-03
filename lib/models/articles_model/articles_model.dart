class ArticleModel {
  int articleId;
  String articleSource;
  String articleSubsection;
  String articleTitle;
  String authorName;
  String articlePublishedDate;
  String articlePhoto;
  String abstractArticle;
  final String blankPhoto =
      "https://firebasestorage.googleapis.com/v0/b/flutter-chat-ec1f2.appspot.com/o/blankphoto.jpg?alt=media&token=174ed9ac-6577-499c-bc09-c58929edf3f3";
  ArticleModel(
      this.articleId,
      this.articleSource,
      this.articleSubsection,
      this.articleTitle,
      this.authorName,
      this.articlePublishedDate,
      this.articlePhoto,
      this.abstractArticle);

  ArticleModel.fromMap(Map<String, dynamic> articleFromMap) {
    this.articleId = articleFromMap['id'] as int;
    this.articleSource = articleFromMap['source'] as String;
    this.articleSubsection = articleFromMap['subsection'] as String;
    this.articleTitle = articleFromMap['title'] as String;
    this.authorName = articleFromMap['byline'] as String;
    this.articlePublishedDate = articleFromMap['published_date'] as String;
    this.abstractArticle = articleFromMap['abstract'] as String;
    try {
      this.articlePhoto =
          articleFromMap['media'][0]['media-metadata'][2]['url'] as String;
    } catch (error) {
      this.articlePhoto = blankPhoto;
    }
  }
}
