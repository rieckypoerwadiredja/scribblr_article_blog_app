class NotificationModel {
  String profileImage;
  String category;
  String type;
  String name;
  String publishDate;
  String publishTime;
  String? contentImage;
  String? desc;

  NotificationModel({
    required this.profileImage,
    required this.category,
    required this.name,
    required this.type,
    required this.publishDate,
    this.desc,
    required this.publishTime,
    this.contentImage,
  });
}
