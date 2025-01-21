import 'package:scribblr_article_blog_app/model/comment_model.dart';

class ArticleModel {
  int id;
  String title;
  String author;
  List<String>
      tags; // Pastikan menggunakan List<String> jika memang tipe string
  String authorImage;
  String publishDate;
  String publishTime;
  String articleImage;
  List<Map<String, dynamic>>
      content; // Menggunakan Map untuk tipe konten yang fleksibel
  int likes;
  List<CommentModel> comments;

  ArticleModel({
    required this.id,
    required this.title,
    required this.author,
    required this.tags,
    required this.authorImage,
    required this.publishDate,
    required this.publishTime,
    required this.articleImage,
    required this.content,
    required this.likes,
    required this.comments,
  });

  ArticleModel copyWith({
    String? title,
    String? author,
    List<String>? tags,
    String? authorImage,
    String? publishDate,
    String? publishTime,
    String? articleImage,
    List<Map<String, dynamic>>? content,
    int? likes,
    List<CommentModel>? comments,
  }) {
    return ArticleModel(
      id: id,
      title: title ?? this.title,
      author: author ?? this.author,
      tags: tags ?? this.tags,
      authorImage: authorImage ?? this.authorImage,
      publishDate: publishDate ?? this.publishDate,
      publishTime: publishTime ?? this.publishTime,
      articleImage: articleImage ?? this.articleImage,
      content: content ?? this.content,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
    );
  }
}
