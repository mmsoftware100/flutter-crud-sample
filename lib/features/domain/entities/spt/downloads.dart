
import '../../../data/const/data.dart';

class Downloads {
  String sDoolUrl;
  String sDoolLang;
  String sDoolSize;
  String sDoolType;
  String sDoolQuality;
  String dtViewsCount;

  Downloads({
    required this.sDoolUrl,
    required this.sDoolLang,
    required this.sDoolSize,
    required this.sDoolType,
    required this.sDoolQuality,
    required this.dtViewsCount
  });

  static Downloads sample() => Downloads(
      sDoolUrl: downloadsDoolUrl,
      sDoolLang: downloadsDoolLang,
      sDoolSize: downloadsDoolSize,
      sDoolType: downloadsDoolType,
      sDoolQuality: downloadsDoolQuality,
      dtViewsCount: downloadDtViewsCount
  );
}
