import 'category_dto.dart';
import 'metadata.dart';

class CategoryResponse {
  int? results;
  Metadata? metadata;
  List<CategoryDTO>? data;

  CategoryResponse({this.results, this.metadata, this.data});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
