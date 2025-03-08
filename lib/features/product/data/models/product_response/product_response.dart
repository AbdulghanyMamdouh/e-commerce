import 'package:shopping_app/features/home/data/models/brand_response/metadata.dart';
import 'package:shopping_app/features/product/data/models/product_response/product_dto.dart';

class ProductResponse {
  int? results;
  Metadata? metadata;
  List<ProductDTO>? data;

  ProductResponse({this.results, this.metadata, this.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
