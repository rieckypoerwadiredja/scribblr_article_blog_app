import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scribblr_article_blog_app/widget/images/loading_image.dart';
import 'package:scribblr_article_blog_app/widget/images/profile_image.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_card.dart';

class WideCard extends StatelessWidget {
  final String articleImage;
  double? width;
  final String title;
  final String authorName;
  final String authorImage;
  final bool? isRead;
  final String publishDate;
  final String publishTime;
  final double constraintsMaxHeight;
  WideCard(
      {super.key,
      required this.articleImage,
      required this.title,
      required this.authorName,
      required this.publishTime,
      this.width,
      this.isRead,
      required this.publishDate,
      required this.constraintsMaxHeight,
      required this.authorImage});

  @override
  Widget build(BuildContext context) {
    DateTime articlePublish = DateFormat('yyyy-MM-dd').parse(publishDate);

    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width ?? screenWidth,
      child: Card(
        shadowColor: Colors.black87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: const BoxConstraints(
                maxWidth: 300,
              ),
              width: screenWidth / 3,
              child: LoadingImage(
                image: articleImage,
                rounded: 20,
                size: double.infinity,
              ),
            ),
            Expanded(
                child: Container(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: screenWidth,
                          child: TitleCard(
                            title: title,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Row(
                          children: [
                            ProfileImage(
                              image: authorImage,
                              size: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              authorName,
                              style: TextStyle(
                                fontSize: 11,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              isRead == null
                                  ? DateTime.now()
                                              .difference(articlePublish)
                                              .inDays >=
                                          1
                                      ? "${DateTime.now().difference(articlePublish).inDays} days ago"
                                      : "${DateTime.now().difference(articlePublish).inHours} hours ago"
                                  : (isRead == true ? "READ" : "UNREAD"),
                              style: TextStyle(
                                fontSize: 11,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => {},
                                  child: const Icon(
                                    Icons.bookmark_added,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => {},
                                  child: const Icon(
                                    Icons.more_vert,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
