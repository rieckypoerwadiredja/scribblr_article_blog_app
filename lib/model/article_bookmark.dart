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
    final index = _bookmarks.indexWhere((bookmark) => bookmark.id == articleId);
    bool isBookmarked;

    if (index == -1) {
      _bookmarks
          .add(BookmarkModel(id: articleId, isRead: false, isPinned: false));
      isBookmarked = true;
    } else {
      _bookmarks.removeAt(index);
      isBookmarked = false;
    }

    notifyListeners(); // Beri tahu UI tentang perubahan

    return {
      'success': true,
      'message': isBookmarked
          ? 'Artikel berhasil ditambahkan ke bookmark.'
          : 'Artikel berhasil dihapus dari bookmark.',
      'isBookmarked': isBookmarked,
    };
  }

  bool isBookmarked(int id) {
    return _bookmarks.any((bookmark) => bookmark.id == id);
  }
}
