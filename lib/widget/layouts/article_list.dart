import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scribblr_article_blog_app/model/article_data.dart';
import 'package:scribblr_article_blog_app/page/article_screen.dart';
import 'package:scribblr_article_blog_app/page/writter_profile_screen.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_card.dart';

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
                      return Card(
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
                            Container(
                              width: double.infinity,
                              height: (constraints.maxHeight * 0.5) -
                                  8, // 50% dari tinggi Card
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 4, bottom: 4),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TitleCard(
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
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const WritterProfileScreen();
                                          }));
                                        },
                                        child: Row(children: [
                                          ClipOval(
                                            child: Image.network(
                                              article.authorImage,
                                              fit: BoxFit.cover,
                                              height: 20,
                                              width: 20,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
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
                                          ],
                                        ]),
                                      ),

                                      if (screenWidth > 375 &&
                                          screenWidth < 550) ...[
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
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ));
        });
  }
}
