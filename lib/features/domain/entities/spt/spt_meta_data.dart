class SptMetaData {
  String termTaxonomyId;
  String taxonomy;
  String termId;
  String name;

  SptMetaData({
    required this.termTaxonomyId,
    required this.taxonomy,
    required this.termId,
    required this.name
  });

  static SptMetaData sample() => SptMetaData(
      termTaxonomyId: "117",
      taxonomy: "taxonomy",
      termId: "117",
      name: "name"
  );
}