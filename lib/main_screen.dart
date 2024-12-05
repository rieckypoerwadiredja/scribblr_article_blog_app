import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/widget/buttons/button_primary.dart';
import 'package:scribblr_article_blog_app/widget/cards/card_menu.dart';
import 'package:scribblr_article_blog_app/widget/cards/head_card.dart';
import 'package:scribblr_article_blog_app/widget/layouts/bottom_navigation.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_card.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_page.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_section.dart';
import 'package:scribblr_article_blog_app/wrapper_scroll.dart';
import 'package:scribblr_article_blog_app/model/article_recent.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
              onPressed: () {},
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
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
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
          DateTime articlePublish =
              DateFormat('yyyy-MM-dd').parse(article.publishDate);

          return InkWell(
            child: SizedBox(
              width: screenWidth / columnCount,
              height: cardHeight,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Container untuk gambar dengan tinggi 50% dari tinggi Card
                        Container(
                          width: double.infinity,
                          height: constraints.maxHeight *
                              0.5, // 50% dari tinggi Card
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                            child: Image.network(
                              article.articleImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Konten Card
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: TitleCard(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  title: screenWidth < 450
                                      ? (article.title.length < 30
                                          ? article.title
                                          : "${article.title.substring(0, 30)}...")
                                      : (screenWidth < 765
                                          ? (article.title.length < 30
                                              ? article.title
                                              : "${article.title.substring(0, 25)}...")
                                          : (article.title.length < 35
                                              ? article.title
                                              : "${article.title.substring(0, 35)}...")),
                                )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipOval(
                                      child: Image.network(
                                        article.authorImage,
                                        fit: BoxFit.cover,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                    if (screenWidth > 375) ...[
                                      Text(
                                        article.author,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                      ),
                                      Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                    ],
                                    // gap publish dan waktu sekarang
                                    Row(
                                      children: [
                                        Text(
                                          DateTime.now()
                                                      .difference(
                                                          articlePublish)
                                                      .inDays >=
                                                  1
                                              ? "${DateTime.now().difference(articlePublish).inDays} days ago"
                                              : "${DateTime.now().difference(articlePublish).inHours} hours ago",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                        ),
                                        Icon(
                                          Icons.more_vert,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
