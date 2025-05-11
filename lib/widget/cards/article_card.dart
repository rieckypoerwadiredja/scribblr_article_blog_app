import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:scribblr_article_blog_app/page/writter_profile_screen.dart';
import 'package:scribblr_article_blog_app/utils/custome_data_type.dart';
import 'package:scribblr_article_blog_app/widget/images/loading_image.dart';
import 'package:scribblr_article_blog_app/widget/images/profile_image.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_card.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final bool? isRead;
  final double width;
  final String authorName;
  final String authorImage;
  final String publishDate;
  final String publishTime;
  final String articleImage;
  final double constraintsMaxHeight;
  final List<DropdownTypeMenuItem>? dropdownMenus;
  final List<Widget> icons;
  ArticleCard(
      {super.key,
      required this.title,
      this.width = double.infinity,
      this.isRead,
      required this.authorName,
      required this.authorImage,
      required this.publishDate,
      required this.publishTime,
      required this.articleImage,
      required this.constraintsMaxHeight,
      required this.icons,
      this.dropdownMenus});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    DateTime articlePublish = DateFormat('yyyy-MM-dd').parse(publishDate);

    // Membuat GlobalKey untuk IconButton
    final GlobalKey iconButtonKey = GlobalKey();

    return Card(
      shadowColor: Colors.black87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Container untuk gambar dengan tinggi 50% dari tinggi Card
          SizedBox(
            width: width,
            height: constraintsMaxHeight * 0.5, // 50% dari tinggi Card
            child: LoadingImage(
              size: 100,
              image: articleImage,
              rounded: 10,
            ),
          ),

          // Konten Card

          Container(
            width: double.infinity,
            height: (constraintsMaxHeight * 0.5) - 8, // 50% dari tinggi Card
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleCard(
                  color: Theme.of(context).colorScheme.onPrimary,
                  maxLines: 2,
                  title: screenWidth < 450
                      ? (title.length < 30
                          ? title
                          : "${title.substring(0, 30)}...")
                      : (screenWidth < 765
                          ? (title.length < 40
                              ? title
                              : "${title.substring(0, 40)}...")
                          : (title.length < 40
                              ? title
                              : "${title.substring(0, 40)}...")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push('/$authorName');
                      },
                      child: Row(children: [
                        ProfileImage(
                          image: authorImage,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          authorName.split(' ')[0],
                          style: TextStyle(
                            fontSize: 10,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ]),
                    ),
                    Row(
                      children: [
                        if (screenWidth > 375) ...[
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
                              fontSize: 10,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ],
                        Row(
                          children: icons,
                        ),
                        InkWell(
                          key: iconButtonKey,
                          onTap: () {
                            // Mengambil posisi IconButton
                            final RenderBox renderBox =
                                iconButtonKey.currentContext?.findRenderObject()
                                    as RenderBox;
                            final position =
                                renderBox.localToGlobal(Offset.zero);

                            showMenu(
                              context: context,
                              position: RelativeRect.fromLTRB(
                                position.dx,
                                position.dy +
                                    renderBox
                                        .size.height, // posisi bawah tombol
                                position.dx + renderBox.size.width,
                                position.dy,
                              ), // Menennentukan posisi menu
                              items: [
                                for (var item in dropdownMenus ?? [])
                                  PopupMenuItem(
                                    value: item
                                        .name, // Mengakses langsung dari objek DropdownTypeMenuItem
                                    onTap: item
                                        .event, // Memanggil event dari objek DropdownTypeMenuItem
                                    child: Text(item.name),
                                  ),
                              ],
                            );
                          },
                          child: Icon(
                            Icons.more_vert,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        )
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
