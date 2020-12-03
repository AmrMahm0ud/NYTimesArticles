class ArticleModel {
  int articleId;
  String articleSource;
  String articleSubsection;
  String articleTitle;
  String authorName;
  String articlePublishedDate;
  String articlePhoto;
  final String blankPhoto =
      "https://firebasestorage.googleapis.com/v0/b/flutter-chat-ec1f2.appspot.com/o/blankphoto.jpg?alt=media&token=174ed9ac-6577-499c-bc09-c58929edf3f3";
  ArticleModel(
      this.articleId,
      this.articleSource,
      this.articleSubsection,
      this.articleTitle,
      this.authorName,
      this.articlePublishedDate,
      this.articlePhoto);

  ArticleModel.fromMap(Map<String, dynamic> articleFromMap) {
    this.articleId = articleFromMap['id'];
    this.articleSource = articleFromMap['source'];
    this.articleSubsection = articleFromMap['subsection'];
    this.articleTitle = articleFromMap['title'];
    this.authorName = articleFromMap['byline'];
    this.articlePublishedDate = articleFromMap['published_date'];
    try {
      this.articlePhoto =
          articleFromMap['media'][0]['media-metadata'][1]['url'];
    } catch (error) {
      this.articlePhoto = blankPhoto;
    }
  }
}
