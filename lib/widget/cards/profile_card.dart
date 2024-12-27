import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/widget/buttons/button_primary.dart';
import 'package:scribblr_article_blog_app/widget/images/profile_image.dart';
import 'package:scribblr_article_blog_app/widget/texts/desc_page.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_card.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String username;
  final String profileImage;
  const ProfileCard(
      {super.key,
      required this.name,
      required this.username,
      required this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfileImage(
          image: profileImage,
          size: 50,
        ),
        Column(
          children: [
            TitleCard(title: name, textAlign: TextAlign.left),
            DescPage(desc: '@$username', textAlign: TextAlign.left)
          ],
        ),
        ButtonPrimary(textButton: "Follow", onClick: () {})
      ],
    );
  }
}
