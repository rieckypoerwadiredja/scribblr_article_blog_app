import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/model/article_data.dart';
import 'package:scribblr_article_blog_app/page/article_screen.dart';
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const NotificationScreen();
                }));
              },
              icon: const Icon(Icons.notifications_outlined)),
          IconButton(
              padding: const EdgeInsets.only(right: 16.0),
              iconSize: 25,
              onPressed: () {},
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
        const CardMenu(
          title: "Recent Articles",
          children: ArticleList(),
        ),
        const CardMenu(
          title: "Your Articles",
          children: ArticleList(),
        ),
        const CardMenu(
          title: "On Your Bookmarks",
          children: ArticleList(),
        ),
      ]),
      bottomNavigationBar: screenWidth <= 768 ? const BottomNavigation() : null,
    );
  }
}

class ArticleList extends StatelessWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: articleList.length,
        itemBuilder: (context, index) {
          final article = articleList[index];

          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ArticleScreen(
                      title: article.title,
                      authorName: article.author,
                      authorImage: article.authorImage,
                      articleImage: article.articleImage,
                      authorUsername: article.author,
                      content: article.content,
                      comments: article.comments,
                      publishDate: article.publishDate,
                      publishTime: article.publishTime,
                      tags: article.tags,
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
                        publishTime: article.publishTime,
                      );
                    },
                  ),
                ),
              ));
        });
  }
}
