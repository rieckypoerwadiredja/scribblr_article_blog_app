import 'package:scribblr_article_blog_app/model/article_model.dart';

class BookmarkModel {
  int id;
  bool isRead;
  bool isPinned;

  BookmarkModel({
    required this.id,
    required this.isRead,
    required this.isPinned,
  });
}

class ArticleBookmarkModel {
  ArticleModel article;
  BookmarkModel bookmark;

  ArticleBookmarkModel({
    required this.article,
    required this.bookmark,
  });

  ArticleBookmarkModel copyWith({
    ArticleModel? article,
    BookmarkModel? bookmark,
  }) {
    return ArticleBookmarkModel(
      article: article ?? this.article,
      bookmark: bookmark ?? this.bookmark,
    );
  }
}
