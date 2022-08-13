class Announcement {
  final String artId;
  final String title;
  final String description;
  final String content;
  final List<String> image;
  final List<String> announcementPdf;
  final String styleCss;
  final String resource;
  final String language;
  final String location;
  final String createDate;
  final String publishDate;
  final String expireDate;
  final String modifiedDate;
  final List<String> smallImageUrl;
  final String smallImageWidth;
  final String smallImageHeight;
  final String smallImageType;
  final String latestTimeQuery;

  Announcement({
        required this.artId,
        required this.title,
        required this.description,
        required this.content,
        required this.image,
        required this.announcementPdf,
        required this.styleCss,
        required this.resource,
        required this.language,
        required this.location,
        required this.createDate,
        required this.publishDate,
        required this.expireDate,
        required this.modifiedDate,
        required this.smallImageUrl,
        required this.smallImageWidth,
        required this.smallImageHeight,
        required this.smallImageType,
        required this.latestTimeQuery
  });
}