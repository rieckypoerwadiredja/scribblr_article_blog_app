import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scribblr_article_blog_app/model/notification_data.dart';
import 'package:scribblr_article_blog_app/page/home_screen.dart';
import 'package:scribblr_article_blog_app/utils/app_padding.dart';
import 'package:scribblr_article_blog_app/utils/custome_data_type.dart';
import 'package:scribblr_article_blog_app/widget/images/loading_image.dart';
import 'package:scribblr_article_blog_app/widget/images/profile_image.dart';
import 'package:scribblr_article_blog_app/widget/layouts/empty_layout.dart';
import 'package:scribblr_article_blog_app/widget/texts/desc_page.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_card.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_page.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationType notificationType = NotificationType.general;

  void changeNotification(NotificationType notification) {
    setState(() {
      notificationType = notification;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

// conversion enum to string
    String notificationTypeString = notificationType.toString().split('.').last;

    final filteredNotifications = notificationList
        .where((n) => n.category == notificationTypeString)
        .toList();

    return Scaffold(
        appBar: AppBar(
          elevation: 4.0,
          title: const TitlePage(
            title: "Notification",
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              context.pop(); // <- go_router way of back
            },
          ),
          actions: [
            IconButton(
                visualDensity:
                    const VisualDensity(horizontal: -2.0, vertical: 0),
                padding: EdgeInsets.zero,
                iconSize: 25,
                onPressed: () {},
                icon: const Icon(Icons.settings)),
          ],
        ),
        body: SingleChildScrollView(
          padding: AppPadding.mainTopPagePadding,
          child: Column(
            children: [
              // TODO: Top navigation General & System
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width:
                      screenWidth > 550 ? screenWidth / 3 * 2 : double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: TextButton(
                                  onPressed: () {
                                    changeNotification(
                                        NotificationType.general);
                                  },
                                  style: TextButton.styleFrom(
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius
                                          .zero, // Tidak ada rounded
                                    ),
                                  ),
                                  child: Text(
                                    "General",
                                    style: TextStyle(
                                        color: notificationType ==
                                                NotificationType.general
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Theme.of(context)
                                                .colorScheme
                                                .onSecondary),
                                  ),
                                ),
                              ),
                              Container(
                                height: 4, // Ketebalan border
                                color:
                                    notificationType == NotificationType.general
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSecondary, // Warna border
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: TextButton(
                                  onPressed: () {
                                    changeNotification(NotificationType.system);
                                  },
                                  style: TextButton.styleFrom(
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius
                                          .zero, // Tidak ada rounded
                                    ),
                                  ),
                                  child: Text(
                                    "System",
                                    style: TextStyle(
                                        color: notificationType ==
                                                NotificationType.general
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onSecondary
                                            : Theme.of(context)
                                                .colorScheme
                                                .primary),
                                  ),
                                ),
                              ),
                              Container(
                                height: 4, // Ketebalan border
                                color: notificationType ==
                                        NotificationType.general
                                    ? Theme.of(context).colorScheme.onSecondary
                                    : Theme.of(context)
                                        .colorScheme
                                        .primary, // Warna border
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // TODO: EMPTY CONTENT
              ...[
                if (filteredNotifications.isEmpty)
                  EmptyLayout(
                      screenWidth: screenWidth,
                      title: "Empty",
                      desc:
                          "Empty You don't have any notification at this time")
                else

                  // TODO CONTENT

                  SizedBox(
                    width: screenWidth > 550
                        ? screenWidth / 3 * 2
                        : double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // TODO Loop Content
                        for (var notification in filteredNotifications)
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black12, // Warna garis bawah
                                  width: 1.0, // Ketebalan garis bawah
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Flex(
                              direction: Axis
                                  .horizontal, // Mengatur layout dalam bentuk baris
                              children: [
                                // Gambar Profil
                                Flexible(
                                  flex: screenWidth < 550
                                      ? 2
                                      : 1, // Menentukan proporsi ruang yang sama dengan konten lainnya
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: AspectRatio(
                                      aspectRatio: 1 /
                                          1, // Memastikan lebar dan tinggi gambar 1:1
                                      child: ClipOval(
                                          child: ProfileImage(
                                        image: notification.profileImage,
                                      )),
                                    ),
                                  ),
                                ),
                                // Teks (Judul dan Deskripsi)
                                Expanded(
                                  flex:
                                      8, // Menentukan proporsi ruang yang diambil teks
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TitleCard(
                                          title: notification.type == "publish"
                                              ? '${notification.name} has published a new article!'
                                              : notification.type == "comment"
                                                  ? '${notification.name} has commented on your article!'
                                                  : notification.type == "like"
                                                      ? '${notification.name} liked your article!'
                                                      : notification
                                                          .name, // Default message jika jenisnya tidak dikenali
                                        ),
                                        DescPage(
                                          desc:
                                              "${timeago.format(DateTime.parse(notification.publishDate))} - ${notification.publishTime}",
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        if (notification.desc != null)
                                          DescPage(
                                            desc: notification.desc ?? "",
                                          ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Gambar Konten
                                Flexible(
                                  flex: screenWidth < 550 ? 3 : 2,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      double containerWidth = constraints
                                          .maxWidth; // Lebar yang didapat dari Flexible
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: notification.contentImage != null
                                            ? LoadingImage(
                                                image:
                                                    notification.contentImage ??
                                                        "",
                                                size:
                                                    containerWidth, // Ukuran berdasarkan ruang yang tersedia
                                                rounded: 10,
                                              )
                                            : Container(
                                                width:
                                                    containerWidth, // Pastikan mengikuti ukuran Flexible
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 3,
                                                        horizontal: 8),
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    child: const Text(
                                                      "New",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      );
                                    },
                                  ),
                                ),

                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.more_vert))
                              ],
                            ),
                          ),
                      ],
                    ),
                  )
              ],
            ],
          ),
        ));
  }
}
