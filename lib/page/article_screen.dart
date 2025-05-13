import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:scribblr_article_blog_app/model/article_bookmark.dart';
import 'package:scribblr_article_blog_app/model/article_data.dart';
import 'package:scribblr_article_blog_app/model/article_model.dart';
import 'package:scribblr_article_blog_app/model/bookmark_model.dart';
import 'package:scribblr_article_blog_app/page/bookmark_screen.dart';
import 'package:scribblr_article_blog_app/page/home_screen.dart';
import 'package:scribblr_article_blog_app/utils/app_padding.dart';
import 'package:scribblr_article_blog_app/utils/get_filter_and_sort_articles_by_tags.dart';
import 'package:scribblr_article_blog_app/utils/get_relative_time.dart';
import 'package:scribblr_article_blog_app/widget/buttons/button_share.dart';
import 'package:scribblr_article_blog_app/widget/buttons/button_tag.dart';
import 'package:scribblr_article_blog_app/widget/cards/article_card.dart';
import 'package:scribblr_article_blog_app/widget/cards/card_menu.dart';
import 'package:scribblr_article_blog_app/widget/cards/comment_card.dart';
import 'package:scribblr_article_blog_app/widget/cards/profile_card.dart';
import 'package:scribblr_article_blog_app/widget/forms/tetfield_profile_image.dart';
import 'package:scribblr_article_blog_app/widget/images/loading_image.dart';
import 'package:scribblr_article_blog_app/widget/layouts/bottom_navigation.dart';
import 'package:scribblr_article_blog_app/widget/texts/desc_page.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_page.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_section.dart';

class ArticleScreen extends StatelessWidget {
  final int id;

  const ArticleScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final articleBookmarkProvider =
        Provider.of<BookmarkProvider>(context, listen: false);
    Map<String, dynamic> articleResult =
        articleBookmarkProvider.getArticleById(id);
    final article = articleResult['article'];
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeght = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 4.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              context.pop(); // <- go_router way of back
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: BookmarkIcon(
                articleId: id,
                color: Colors.white,
              ),
            ),
            ButtonShare(
              title: article.title,
              defaultText: "Read Interesting Articles:",
              url: 'https://scribblr-bible.vercel.app/',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: screenHeght / 3 * 2,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Image.network(
                    article.articleImage,
                    height: screenHeght / 3 * 2,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      // Placeholder ketika gambar gagal dimuat
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.grey,
                              size: screenHeght / 3 * 2 / 10, // Ikon error
                            ),
                            Text(
                              'Error loading image', // Teks placeholder
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: (screenHeght * 2 / 3) / 20,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            // TODO Content - Profile Card
            Padding(
              padding: AppPadding.mainTopPagePadding,
              child: TitlePage(title: article.title),
            ),
            const SizedBox(
              height: 15,
            ),
            // Garis batas
            Divider(
              color: Colors.grey[200],
              thickness: 1.0,
              indent: 0,
              endIndent: 0,
            ),

            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 16, right: 16),
              child: ProfileCard(
                name: article.author,
                profileImage: article.authorImage,
                username: article.author,
              ),
            ),
            // Garis batas
            Divider(
              color: Colors.grey[200],
              thickness: 1.0,
              indent: 0,
              endIndent: 0,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  for (var tag in article.tags)
                    ButtonTag(
                      textButton: tag,
                      onClick: () {},
                    ),
                  DescPage(
                      desc: getRelativeTime(
                          article.publishDate, article.publishTime)),
                ],
              ),
            ),

            // TODO Content Desc artcle
            Padding(
              padding: AppPadding.articlePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var item in article.content) ...[
                    if (item["type"] == "text") DescPage(desc: item["value"]),
                    if (item["type"] == "quote")
                      DescPage(
                        desc: item["value"],
                        fontStyle: FontStyle.italic,
                        bold: FontWeight.bold,
                      ),
                    if (item["type"] == "image")
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Container(
                              color: Colors.grey[300],
                              width: double.infinity,
                              height: 200,
                              child: LoadingImage(
                                image: item["value"],
                              ))),
                    const SizedBox(height: 16),
                  ]
                ],
              ),
            ),

            // TODO Comment Section

            Padding(
                padding: AppPadding.mainPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Divider(
                      color: Colors.grey[200],
                      thickness: 1.0,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Row(
                      children: [
                        TitleSection(
                          title: "Comments (${article.comments.length})",
                          textAlign: TextAlign.start,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_right_alt_rounded,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    Divider(
                      color: Colors.grey[200],
                      thickness: 1.0,
                      indent: 0,
                      endIndent: 0,
                    ),
                    ...[
                      for (var comment in article.comments)
                        CommentCard(
                            marginVertical: 5,
                            profileImage: comment.commenterImage,
                            comment: comment.commentText,
                            like: comment.commentLikes,
                            name: comment.commenterName),
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    const TetfieldProfileImage()
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 1.0,
              indent: 0,
              endIndent: 0,
            ),

            Padding(
              padding: AppPadding.mainPadding,
              child: CardMenu(
                title: "More Article Like This",
                children: ArticleList(tags: article.tags),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: screenWidth <= 768 ? const BottomNavigation() : null,
    );
  }
}

class ArticleList extends StatelessWidget {
  final List<String> tags;
  const ArticleList({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // TODO Get Data List all & Bookmark articles
    final articleProvider =
        Provider.of<ArticleProvider>(context, listen: false);
    List<ArticleModel> articles = articleProvider.articles;

    // Tentukan jumlah kolom berdasarkan lebar layar
    int columnCount;
    if (screenWidth <= 450) {
      columnCount = 2;
    } else if (screenWidth <= 650) {
      columnCount = 2;
    } else if (screenWidth > 650 && screenWidth <= 920) {
      columnCount = 3;
    } else {
      columnCount = 4;
    }
    final double cardHeight = screenWidth < 450
        ? 250 // Tinggi untuk layar kecil
        : (screenWidth < 765 ? 250 : 300);

    final activeTags = tags;
    final articleListRelatebyTags =
        getFilterAndSortArticles(articles, activeTags);

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: articleListRelatebyTags.length,
        itemBuilder: (context, index) {
          final article = articleListRelatebyTags[index];

          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ArticleScreen(
                      id: article.id,
                    );
                  }));
                },
                child: SizedBox(
                  width: screenWidth / columnCount,
                  height: cardHeight,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return ArticleCard(
                          title: article.title,
                          authorName: article.author,
                          authorImage: article.authorImage,
                          constraintsMaxHeight: constraints.maxHeight,
                          articleImage: article.articleImage,
                          publishDate: article.publishDate,
                          icons: const <Widget>[], // ? NOT USE ICON
                          publishTime: article.publishTime);
                    },
                  ),
                ),
              ));
        });
  }
}
