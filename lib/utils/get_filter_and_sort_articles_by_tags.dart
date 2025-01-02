import 'package:scribblr_article_blog_app/model/article_model.dart';

List<ArticleModel> getFilterAndSortArticles(
    List<ArticleModel> articleList, List<String> activeTags) {
  // Filter artikel yang memiliki setidaknya satu tag yang cocok
  final filteredArticles = articleList.where((article) {
    final matchingTags =
        article.tags.where((tag) => activeTags.contains(tag)).toList();
    return matchingTags.isNotEmpty;
  }).toList();

  // Tambahkan properti sementara untuk jumlah kecocokan
  filteredArticles.sort((a, b) {
    final aMatchCount = a.tags.where((tag) => activeTags.contains(tag)).length;
    final bMatchCount = b.tags.where((tag) => activeTags.contains(tag)).length;
    return bMatchCount.compareTo(aMatchCount); // Urutkan dari yang terbanyak
  });
  print(filteredArticles);
  return filteredArticles;
}
