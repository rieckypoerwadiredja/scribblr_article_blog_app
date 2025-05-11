import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/model/article_data.dart';
import 'package:scribblr_article_blog_app/model/article_model.dart';
import 'package:scribblr_article_blog_app/model/bookmark_model.dart';

class BookmarkProvider extends ChangeNotifier {
  final ArticleProvider articleProvider;
  List<BookmarkModel> _bookmarks = [
    BookmarkModel(id: 1727748932, isRead: false, isPinned: true),
    BookmarkModel(id: 1928181090, isRead: false, isPinned: true),
  ];
  List<BookmarkModel> get bookmarks => _bookmarks;

  // Menyimpan instance ArticleProvider dalam konstruktor
  BookmarkProvider({required this.articleProvider});

  List<ArticleBookmarkModel> get bookmarkedArticles {
    List<ArticleModel> articles = articleProvider.articles;

    // Menggabungkan BookmarkModel dan ArticleModel yang sesuai
    return _bookmarks.map((bookmark) {
      var article = articles.firstWhere((article) => article.id == bookmark.id,
          orElse: () {
        return ArticleModel(
          id: -1,
          title: 'Not Found',
          author: 'Unknown',
          tags: [],
          authorImage: '',
          publishDate: '',
          publishTime: '',
          articleImage: '',
          content: [],
          likes: 0,
          comments: [],
        );
      });
      return ArticleBookmarkModel(article: article, bookmark: bookmark);
    }).toList();
  }

  Map<String, dynamic> toggleBookmark(int articleId) {
    try {
      final index =
          _bookmarks.indexWhere((bookmark) => bookmark.id == articleId);
      bool isBookmarked;

      if (index == -1) {
        _bookmarks
            .add(BookmarkModel(id: articleId, isRead: false, isPinned: false));
        isBookmarked = true;
      } else {
        _bookmarks.removeAt(index);
        isBookmarked = false;
      }

      notifyListeners(); // Notify UI about changes

      return {
        'success': true,
        'message': isBookmarked
            ? 'Article successfully added to bookmarks.'
            : 'Article successfully removed from bookmarks.',
        'isBookmarked': isBookmarked,
      };
    } catch (e) {
      debugPrint('❌ Error in toggleBookmark: $e'); // Log error to console
      return {
        'success': false,
        'message': 'An error occurred while updating the bookmark.',
        'isBookmarked': null,
      };
    }
  }

  bool isBookmarked(int id) {
    return _bookmarks.any((bookmark) => bookmark.id == id);
  }

  Map<String, dynamic> getArticleById(int id) {
    final article = articleProvider.articles.cast<ArticleModel?>().firstWhere(
          (article) => article?.id == id,
          orElse: () => null,
        );

    if (article != null) {
      return {
        'success': true,
        'message': 'Article found.',
        'article': article,
      };
    } else {
      debugPrint('❌ Error: Article with ID $id not found.');
      return {
        'success': false,
        'message': 'Article with ID $id not found.',
        'article': null,
      };
    }
  }
}
