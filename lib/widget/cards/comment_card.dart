import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/widget/images/profile_image.dart';
import 'package:scribblr_article_blog_app/widget/texts/desc_page.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_card.dart';

class CommentCard extends StatelessWidget {
  final String profileImage;
  final String name;
  final String comment;
  final double marginVertical;
  const CommentCard(
      {super.key,
      required this.profileImage,
      required this.comment,
      required this.name,
      required this.marginVertical});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: marginVertical),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ProfileImage(
                      image: profileImage,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TitleCard(
                      title: name,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            DescPage(desc: comment),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(Icons.favorite_border_outlined),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "200",
                        style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "2 mouth ago",
                  style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                )
              ],
            )
          ],
        ));
  }
}
