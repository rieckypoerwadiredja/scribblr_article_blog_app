import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/model/article_recent.dart';
import 'package:scribblr_article_blog_app/utils/get_relative_time.dart';
import 'package:scribblr_article_blog_app/widget/buttons/button_tag.dart';
import 'package:scribblr_article_blog_app/widget/cards/article_card.dart';
import 'package:scribblr_article_blog_app/widget/cards/card_menu.dart';
import 'package:scribblr_article_blog_app/widget/cards/comment_card.dart';
import 'package:scribblr_article_blog_app/widget/cards/profile_card.dart';
import 'package:scribblr_article_blog_app/widget/forms/tetfield_profile_image.dart';
import 'package:scribblr_article_blog_app/widget/texts/desc_page.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_page.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_section.dart';

class ArticleScreen extends StatelessWidget {
  final String title;
  final String authorName;
  final String authorImage;
  final String authorUsername;
  final String publishDate;
  final String publishTime;
  final List content;

  const ArticleScreen(
      {super.key,
      required this.title,
      required this.authorName,
      required this.authorImage,
      required this.authorUsername,
      required this.publishDate,
      required this.publishTime,
      required this.content});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeght = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: screenHeght / 3 * 2,
                width: double.infinity,
                color: Colors.grey[300], // Warna abu-abu tipis
                child: Image.network(
                  "https://images.unsplash.com/photo-1530789253388-582c481c54b0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  height: screenHeght / 3 * 2,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child; // Gambar selesai dimuat
                    } else {
                      return const Center(
                        child:
                            CircularProgressIndicator(), // Placeholder saat loading
                      );
                    }
                  },
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.bookmark_add_outlined,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
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
                    ],
                  ),
                ),
              )
            ],
          ),

          // TODO Content - Profile Card
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
            child: TitlePage(title: title),
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
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
            child: ProfileCard(
              name: authorName,
              profileImage: authorImage,
              username: authorName,
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
            child: Row(
              children: [
                ButtonTag(textButton: "Travel", onClick: () {}),
                const SizedBox(
                  width: 15,
                ),
                DescPage(desc: getRelativeTime(publishDate, publishTime))
              ],
            ),
          ),

          // TODO Content Desc artcle
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var item in content) ...[
                  if (item["type"] == "text") DescPage(desc: item["value"]),
                  if (item["type"] == "image")
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          color: Colors.grey[300],
                          width: double.infinity,
                          height: 200,
                          child: Image.network(
                            item["value"],
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
                          ),
                        )),
                  const SizedBox(height: 16),
                ]
              ],
            ),
          ),

          // TODO Comment Section

          Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
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
                      const TitleSection(
                        title: "Comments (120)",
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
                  const CommentCard(
                      marginVertical: 5,
                      profileImage:
                          'https://plus.unsplash.com/premium_photo-1661877737564-3dfd7282efcb?q=80&w=1800&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      comment:
                          "Great article! I've been to a few of these destinations & can't wait to add more to my list",
                      name: "Bella Suagwan"),
                  const CommentCard(
                      marginVertical: 5,
                      profileImage:
                          'https://plus.unsplash.com/premium_photo-1661877737564-3dfd7282efcb?q=80&w=1800&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      comment:
                          "Great article! I've been to a few of these destinations & can't wait to add more to my list",
                      name: "Bella Suagwan"),
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

          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: CardMenu(
              title: "More Article Like This",
              children: ArticleList(),
            ),
          )
        ],
      ),
    ));
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
                      authorUsername: article.author,
                      content: article.content,
                      publishDate: article.publishDate,
                      publishTime: article.publishTime,
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
                          publishTime: article.publishTime);
                    },
                  ),
                ),
              ));
        });
  }
}
