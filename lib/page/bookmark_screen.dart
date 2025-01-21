import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/model/article_bookmark.dart';
import 'package:scribblr_article_blog_app/model/article_data.dart';
import 'package:scribblr_article_blog_app/model/bookmark_model.dart';
import 'package:scribblr_article_blog_app/utils/app_padding.dart';
import 'package:scribblr_article_blog_app/widget/cards/article_card.dart';
import 'package:scribblr_article_blog_app/widget/cards/wide_card.dart';
import 'package:scribblr_article_blog_app/widget/layouts/empty_layout.dart';
import 'package:scribblr_article_blog_app/widget/texts/desc_page.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_page.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  bool viewType = true;

  void changeViewType(type) {
    // True: Grid
    // False: Column
    setState(() {
      viewType = type;
    });
  }

  int getCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= 425) {
      return 1;
    } else if (screenWidth <= 650) {
      return 2;
    } else {
      return 3;
    }
  }

  // TODO Seach Bookmark article
  List<ArticleBookmarkModel> bookmarkFullData = articleList
      .where((article) =>
          articleBookmarkList.any((bookmark) => bookmark.id == article.id))
      .map((article) {
    final bookmark = articleBookmarkList.firstWhere((b) => b.id == article.id);
    return ArticleBookmarkModel(article: article, bookmark: bookmark);
  }).toList();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 4.0,
          title: const TitlePage(
            title: "My Bookmark",
          ),
          actions: [
            IconButton(
                visualDensity:
                    const VisualDensity(horizontal: -2.0, vertical: 0),
                padding: EdgeInsets.zero,
                iconSize: 25,
                onPressed: () {},
                icon: const Icon(Icons.search)),
          ],
        ),
        body: SingleChildScrollView(
            padding: AppPadding.mainTopPagePadding,
            child: Center(
              child: Container(
                width: screenWidth > 550 ? screenWidth * 0.8 : screenWidth,
                padding: AppPadding.mainTopPagePadding,
                child: Column(
                  children: [
                    // TODO: Information section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const DescPage(
                          desc: "48 Article",
                          bold: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            IconButton(
                                color: viewType
                                    ? Theme.of(context).colorScheme.onSecondary
                                    : Theme.of(context).colorScheme.primary,
                                padding: const EdgeInsets.all(2),
                                onPressed: () {
                                  changeViewType(false);
                                },
                                icon: const Icon(
                                  Icons.article,
                                )),
                            IconButton(
                                color: viewType
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.onSecondary,
                                padding: const EdgeInsets.all(2),
                                onPressed: () {
                                  changeViewType(true);
                                },
                                icon: const Icon(Icons.grid_view_rounded)),
                          ],
                        )
                      ],
                    ),
                    // TODO Content
                    if (bookmarkFullData.isEmpty)
                      EmptyLayout(
                          screenWidth: screenWidth,
                          title: "Empty",
                          desc:
                              "Empty You don't have any bookmark article at this time")
                    else
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: viewType
                                ? getCrossAxisCount(context)
                                : 1, // Jumlah kolom
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent: viewType
                                ? 200
                                : (screenWidth > 550 ? 175 : 150),
                          ),
                          itemCount: bookmarkFullData.length,
                          itemBuilder: (context, index) {
                            return LayoutBuilder(
                                builder: (context, constraints) {
                              return viewType
                                  ? ArticleCard(
                                      title:
                                          bookmarkFullData[index].article.title,
                                      authorName: bookmarkFullData[index]
                                          .article
                                          .author,
                                      authorImage: bookmarkFullData[index]
                                          .article
                                          .articleImage,
                                      publishDate: bookmarkFullData[index]
                                          .article
                                          .publishDate,
                                      publishTime: bookmarkFullData[index]
                                          .article
                                          .publishTime,
                                      articleImage: bookmarkFullData[index]
                                          .article
                                          .articleImage,
                                      constraintsMaxHeight:
                                          constraints.maxHeight,
                                      isRead: bookmarkFullData[index]
                                          .bookmark
                                          .isRead,
                                    )
                                  : WideCard(
                                      title:
                                          bookmarkFullData[index].article.title,
                                      authorName: bookmarkFullData[index]
                                          .article
                                          .author,
                                      authorImage: bookmarkFullData[index]
                                          .article
                                          .articleImage,
                                      publishDate: bookmarkFullData[index]
                                          .article
                                          .publishDate,
                                      publishTime: bookmarkFullData[index]
                                          .article
                                          .publishTime,
                                      articleImage: bookmarkFullData[index]
                                          .article
                                          .articleImage,
                                      constraintsMaxHeight:
                                          constraints.maxHeight,
                                      isRead: bookmarkFullData[index]
                                          .bookmark
                                          .isRead,
                                    );
                            });
                          },
                        ),
                      )
                  ],
                ),
              ),
            )));
  }
}
