import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:scribblr_article_blog_app/model/article_bookmark.dart';
import 'package:scribblr_article_blog_app/model/bookmark_model.dart';
import 'package:scribblr_article_blog_app/page/article_screen.dart';
import 'package:scribblr_article_blog_app/page/home_screen.dart';
import 'package:scribblr_article_blog_app/utils/app_padding.dart';
import 'package:scribblr_article_blog_app/widget/cards/article_card.dart';
import 'package:scribblr_article_blog_app/widget/cards/wide_card.dart';
import 'package:scribblr_article_blog_app/widget/layouts/empty_layout.dart';
import 'package:scribblr_article_blog_app/widget/texts/desc_page.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_page.dart';

class BookmarkIcon extends StatelessWidget {
  BookmarkIcon({super.key, required this.articleId, this.color = Colors.black});
  final int articleId;
  Color color;

  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = Provider.of<BookmarkProvider>(context);
    bool isBookmarked = bookmarkProvider.isBookmarked(articleId);

    return GestureDetector(
      onTap: () {
        if (isBookmarked) {
          // Jika sudah di-bookmark, tampilkan dialog konfirmasi
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Confirmation"),
              content: const Text(
                  "Are you sure you want to remove this from bookmarks?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context), // Tutup dialog
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Tutup dialog
                    final result = bookmarkProvider.toggleBookmark(articleId);
                    _showSnackBar(
                        context, result['message']); // Tampilkan SnackBar
                  },
                  child: const Text("Yes"),
                ),
              ],
            ),
          );
        } else {
          // Jika belum di-bookmark, langsung tambahkan
          final result = bookmarkProvider.toggleBookmark(articleId);
          _showSnackBar(context, result['message']); // Tampilkan SnackBar
        }
      },
      child: Icon(
        isBookmarked ? Icons.bookmark_added : Icons.bookmark_add_outlined,
        color: isBookmarked ? color : color,
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2), // Muncul selama 2 detik
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final bookmarkProvider = Provider.of<BookmarkProvider>(context);
    List<ArticleBookmarkModel> bookmarkedArticles =
        bookmarkProvider.bookmarkedArticles;

    return Scaffold(
        appBar: AppBar(
          elevation: 4.0,
          title: const TitlePage(
            title: "My Bookmark",
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              context.pop(); // <- go_router way of back
            },
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
                    if (bookmarkedArticles.isEmpty)
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
                          itemCount: bookmarkedArticles.length,
                          itemBuilder: (context, index) {
                            return LayoutBuilder(
                                builder: (context, constraints) {
                              return viewType
                                  ? InkWell(
                                      onTap: () {
                                        final id = bookmarkedArticles[index]
                                            .article
                                            .id;
                                        final title = bookmarkedArticles[index]
                                            .article
                                            .title;
                                        final author = bookmarkedArticles[index]
                                            .article
                                            .author;

                                        if (id != null &&
                                            title != null &&
                                            author != null) {
                                          final safeTitle =
                                              title.replaceAll(' ', '-');
                                          final safeAuthor =
                                              author.replaceAll(' ', '-');

                                          context.goNamed(
                                            'article',
                                            pathParameters: {
                                              'writer': safeAuthor,
                                              'titleId': '$safeTitle-$id',
                                            },
                                          );
                                        } else {
                                          debugPrint(
                                              '❌ Error: article, author, or id is null.');
                                        }
                                      },
                                      child: ArticleCard(
                                        title: bookmarkedArticles[index]
                                            .article
                                            .title,
                                        authorName: bookmarkedArticles[index]
                                            .article
                                            .author,
                                        authorImage: bookmarkedArticles[index]
                                            .article
                                            .articleImage,
                                        publishDate: bookmarkedArticles[index]
                                            .article
                                            .publishDate,
                                        publishTime: bookmarkedArticles[index]
                                            .article
                                            .publishTime,
                                        articleImage: bookmarkedArticles[index]
                                            .article
                                            .articleImage,
                                        constraintsMaxHeight:
                                            constraints.maxHeight,
                                        isRead: bookmarkedArticles[index]
                                            .bookmark
                                            .isRead,
                                        icons: <Widget>[
                                          BookmarkIcon(
                                            articleId: bookmarkedArticles[index]
                                                .article
                                                .id,
                                          ),
                                        ],
                                        dropdownMenus: [
                                          // ! DropdownTypeMenuItem(
                                          //   name:
                                          //       "Delete from Bookmark", // Properti name diisi dengan string
                                          //   event: () => deleteBookmark(
                                          //       bookmarkedArticles[index]
                                          //           .article
                                          //           .id), // Properti event diisi dengan function
                                          // ),
                                        ],
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        final id = bookmarkedArticles[index]
                                            .article
                                            .id;
                                        final title = bookmarkedArticles[index]
                                            .article
                                            .title;
                                        final author = bookmarkedArticles[index]
                                            .article
                                            .author;

                                        if (id != null &&
                                            title != null &&
                                            author != null) {
                                          final safeTitle =
                                              title.replaceAll(' ', '-');
                                          final safeAuthor =
                                              author.replaceAll(' ', '-');

                                          context.goNamed(
                                            'article',
                                            pathParameters: {
                                              'writer': safeAuthor,
                                              'titleId': '$safeTitle-$id',
                                            },
                                          );
                                        } else {
                                          debugPrint(
                                              '❌ Error: article, author, or id is null.');
                                        }
                                      },
                                      child: WideCard(
                                          articleId: bookmarkedArticles[index]
                                              .article
                                              .id,
                                          title: bookmarkedArticles[index]
                                              .article
                                              .title,
                                          authorName: bookmarkedArticles[index]
                                              .article
                                              .author,
                                          authorImage: bookmarkedArticles[index]
                                              .article
                                              .articleImage,
                                          publishDate: bookmarkedArticles[index]
                                              .article
                                              .publishDate,
                                          publishTime: bookmarkedArticles[index]
                                              .article
                                              .publishTime,
                                          articleImage:
                                              bookmarkedArticles[index]
                                                  .article
                                                  .articleImage,
                                          constraintsMaxHeight:
                                              constraints.maxHeight,
                                          isRead: bookmarkedArticles[index]
                                              .bookmark
                                              .isRead,
                                          icons: <Widget>[
                                            BookmarkIcon(
                                              articleId:
                                                  bookmarkedArticles[index]
                                                      .article
                                                      .id,
                                            ), // Instansiasi dengan parameter
                                            GestureDetector(
                                              onTap: () => {},
                                              child: const Icon(
                                                Icons.more_vert,
                                              ),
                                            ),
                                          ]));
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
