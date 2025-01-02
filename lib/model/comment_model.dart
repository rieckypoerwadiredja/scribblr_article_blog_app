class CommentModel {
  String commenterName; // Nama komentator
  String commenterImage; // URL foto atau avatar dari komentator
  String commentText; // Isi komentar
  int commentLikes; // Jumlah suka pada komentar

  CommentModel({
    required this.commenterName,
    required this.commenterImage,
    required this.commentText,
    required this.commentLikes,
  });
}
