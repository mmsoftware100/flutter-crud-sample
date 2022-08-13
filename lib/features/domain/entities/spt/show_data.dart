
import 'package:base/features/domain/entities/spt/repeatable_fields.dart';

import '../../../data/const/data.dart';
import 'downloads.dart';

class ShowData {
  String serie;
  String temporada;
  String episodio;
  List<Downloads> downloads;
  List<RepeatableFields> repeatableFields;

  ShowData({
    required this.serie,
    required this.temporada,
    required this.episodio,
    required this.downloads,
    required this.repeatableFields
  });

  static ShowData sample() => ShowData(
      serie: showDataSerie,
      temporada: showDataTemporada,
      episodio: showDataEpisodio,
      downloads: [
        Downloads.sample(),
        Downloads.sample(),
        Downloads.sample(),
      ],
    repeatableFields: [RepeatableFields.sample()],
  );

}