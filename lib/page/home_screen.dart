import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:scribblr_article_blog_app/model/article_bookmark.dart';
import 'package:scribblr_article_blog_app/model/article_data.dart';
import 'package:scribblr_article_blog_app/model/article_model.dart';
import 'package:scribblr_article_blog_app/model/bookmark_model.dart';
import 'package:scribblr_article_blog_app/page/article_screen.dart';
import 'package:scribblr_article_blog_app/page/bookmark_screen.dart';
import 'package:scribblr_article_blog_app/page/notification_screen.dart';
import 'package:scribblr_article_blog_app/utils/app_padding.dart';
import 'package:scribblr_article_blog_app/widget/buttons/button_primary.dart';
import 'package:scribblr_article_blog_app/widget/cards/article_card.dart';
import 'package:scribblr_article_blog_app/widget/cards/card_menu.dart';
import 'package:scribblr_article_blog_app/widget/cards/head_card.dart';
import 'package:scribblr_article_blog_app/widget/layouts/bottom_navigation.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_page.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_section.dart';
import 'package:scribblr_article_blog_app/wrapper_scroll.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // TODO Get Data List all & Bookmark articles
    final articleProvider =
        Provider.of<ArticleProvider>(context, listen: false);
    List<ArticleModel> articles = articleProvider.articles;

    final bookmarkProvider = Provider.of<BookmarkProvider>(
        context); // Tidak perlu 'listen: false' karena ini dalam build method
    List<ArticleBookmarkModel> bookmarkedArticles =
        bookmarkProvider.bookmarkedArticles;

    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset('images/scribblr_logo_without_text.png'),
          ),
        ),
        title: const TitlePage(
          title: "Scribblr",
        ),
        actions: [
          IconButton(
              visualDensity: const VisualDensity(horizontal: -2.0, vertical: 0),
              padding: EdgeInsets.zero,
              iconSize: 25,
              onPressed: () {
                GoRouter.of(context).push('/notification');
              },
              icon: const Icon(Icons.notifications_outlined)),
          IconButton(
              iconSize: 25,
              onPressed: () {
                GoRouter.of(context).push('/bookmarks');
              },
              icon: const Icon(Icons.bookmark_border_outlined))
        ],
      ),
      body: WrapperScroll(children: [
        // Hero Card
        HeadCard(
          children: Padding(
              padding: AppPadding.mainPadding,
              child: Stack(
                children: [
                  // Image di background
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'images/writter_woman.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // Konten utama card
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const TitleSection(
                        color: Colors.white,
                        title: "Learn how to become a\ngreat writer right now!",
                      ),
                      SizedBox(
                        height: 30,
                        child: ButtonPrimary(
                          bgColor: Colors.white,
                          textColor: Theme.of(context).colorScheme.primary,
                          textButton: "Read more",
                          onClick: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
        // Section Recent Article
        CardMenu(
          title: "Recent Articles",
          children: ArticleList(
            data: [...articles],
          ),
        ),
        CardMenu(
          title: "Your Articles",
          children: ArticleList(
            data: [...articles],
          ),
        ),
        CardMenu(
          title: "On Your Bookmarks",
          children: ArticleList(
            data:
                bookmarkedArticles.map((bookmark) => bookmark.article).toList(),
          ),
        ),
      ]),
      bottomNavigationBar: screenWidth <= 768 ? const BottomNavigation() : null,
    );
  }
}

class ArticleList extends StatelessWidget {
  final List data;
  const ArticleList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Tentukan jumlah kolom berdasarkan lebar layar
    int columnCount;
    if (screenWidth <= 450) {
      columnCount = 2;
    } else if (screenWidth <= 650) {
      columnCount = 3;
    } else if (screenWidth > 650 && screenWidth <= 920) {
      columnCount = 4;
    } else {
      columnCount = 5;
    }
    final double cardHeight = screenWidth < 450
        ? 250 // Tinggi untuk layar kecil
        : (screenWidth < 765 ? 250 : 300);

    // Cek apakah data kosong
    if (data.isEmpty) {
      return const Center(
        child: Text(
          "No Data Available", // Pesan yang muncul saat data kosong
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final article = data[index];

          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: InkWell(
                onTap: () {
                  final id = article.id ?? article.article?.id;
                  final title = article.title ?? article.article?.title;
                  final author = article.author ?? article.article?.author;

                  if (id != null && title != null && author != null) {
                    final safeTitle = title.replaceAll(' ', '-');
                    final safeAuthor = author.replaceAll(' ', '-');

                    context.goNamed(
                      'article',
                      pathParameters: {
                        'writer': safeAuthor,
                        'titleId': '$safeTitle-$id',
                      },
                    );
                  } else {
                    debugPrint('❌ Error: article, author, or id is null.');
                  }
                },
                child: SizedBox(
                  width: screenWidth / columnCount,
                  height: cardHeight,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return ArticleCard(
                        title: article.title ?? article.article?.title,
                        authorName: article.author ?? article.article?.author,
                        authorImage:
                            article.authorImage ?? article.article?.authorImage,
                        articleImage: article.articleImage ??
                            article.article?.articleImage,
                        publishDate:
                            article.publishDate ?? article.article?.publishDate,
                        publishTime:
                            article.publishTime ?? article.article?.publishTime,
                        constraintsMaxHeight: constraints.maxHeight,
                        icons: const <Widget>[], // ? NOT USE ICON
                        dropdownMenus: [
                          // DropdownTypeMenuItem(
                          //   name: "Add to Bookmark",
                          //   event: () => addBookmark(article.id, false, false),
                          // ),
                        ],
                      );
                    },
                  ),
                ),
              ));
        });
  }
}
