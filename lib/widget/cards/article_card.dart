import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scribblr_article_blog_app/page/writter_profile_screen.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_card.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String authorName;
  final String authorImage;
  final String publishDate;
  final String publishTime;
  final String articleImage;
  final double constraintsMaxHeight;

  const ArticleCard({
    super.key,
    required this.title,
    required this.authorName,
    required this.authorImage,
    required this.publishDate,
    required this.publishTime,
    required this.articleImage,
    required this.constraintsMaxHeight,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    DateTime articlePublish = DateFormat('yyyy-MM-dd').parse(publishDate);

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Container untuk gambar dengan tinggi 50% dari tinggi Card
          Container(
            width: double.infinity,
            height: constraintsMaxHeight * 0.5, // 50% dari tinggi Card
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
                articleImage,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Konten Card
          Container(
            width: double.infinity,
            height: (constraintsMaxHeight * 0.5) - 8, // 50% dari tinggi Card
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleCard(
                  color: Theme.of(context).colorScheme.onPrimary,
                  title: screenWidth < 450
                      ? (title.length < 30
                          ? title
                          : "${title.substring(0, 30)}...")
                      : (screenWidth < 765
                          ? (title.length < 30
                              ? title
                              : "${title.substring(0, 25)}...")
                          : (title.length < 35
                              ? title
                              : "${title.substring(0, 35)}...")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const WritterProfileScreen();
                        }));
                      },
                      child: Row(children: [
                        ClipOval(
                          child: Image.network(
                            authorImage,
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
                            authorName,
                            style: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ]),
                    ),

                    if (screenWidth > 375 && screenWidth < 550) ...[
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ],
                    // gap publish dan waktu sekarang
                    Row(
                      children: [
                        Text(
                          DateTime.now().difference(articlePublish).inDays >= 1
                              ? "${DateTime.now().difference(articlePublish).inDays} days ago"
                              : "${DateTime.now().difference(articlePublish).inHours} hours ago",
                          style: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Theme.of(context).colorScheme.onPrimary,
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
  }
}
