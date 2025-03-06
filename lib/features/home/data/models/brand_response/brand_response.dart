import 'brand_dto.dart';
import 'metadata.dart';

class BrandResponse {
  int? results;
  Metadata? metadata;
  List<BrandDTO>? data;

  BrandResponse({this.results, this.metadata, this.data});

  factory BrandResponse.fromJson(Map<String, dynamic> json) => BrandResponse(
        results: json['results'] as int?,
        metadata: json['metadata'] == null
            ? null
            : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => BrandDTO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
