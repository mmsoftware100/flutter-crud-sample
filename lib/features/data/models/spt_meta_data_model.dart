
import 'package:base/features/domain/entities/spt/spt_meta_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spt_meta_data_model.g.dart';
@JsonSerializable(explicitToJson: true)
class SptMetaDataModel {

  @JsonKey(name: 'term_taxonomy_id', defaultValue: "term_taxonomy_id")
  String termTaxonomyId;

  @JsonKey(name: 'taxonomy', defaultValue: "taxonomy")
  String taxonomy;

  @JsonKey(name: 'term_id', defaultValue: "term_id")
  String termId;

  @JsonKey(name: 'name', defaultValue: "name")
  String name;

  SptMetaDataModel({
    required this.termTaxonomyId,
    required this.taxonomy,
    required this.termId,
    required this.name
  });


  SptMetaData toEntity(){
    return SptMetaData(termTaxonomyId: termTaxonomyId, taxonomy: taxonomy, termId: termId, name: name);
  }

  factory SptMetaDataModel.fromJson(Map<String, dynamic> json) =>  _$SptMetaDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$SptMetaDataModelToJson(this);

}