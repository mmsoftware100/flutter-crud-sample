class LatestNews {
  final String id;
  final String title;
  final String subtitle;
  final String content;
  final String pdf;
  final String video;
  final String image;
  final List<String> pdfs;
  final List<String> videos;
  final List<String> images;
  final String publishDate;

  LatestNews({
        required this.id,
        required this.title,
        required this.subtitle,
        required this.content,
        required this.pdf,
        required this.video,
        required this.image,
        required this.pdfs,
        required this.videos,
        required this.images,
        required this.publishDate
  });

  static LatestNews sample() => LatestNews(
      id: "artId",
      title: "titleExport",
      subtitle: "description",
      content: "content",
      pdf: "newsPdf",
      publishDate: "publishDate",
      video: 'video',
      image: 'image',
      pdfs: [],
      videos: [],
      images: []
  );
}