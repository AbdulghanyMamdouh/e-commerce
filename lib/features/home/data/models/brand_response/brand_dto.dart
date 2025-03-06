import 'package:shopping_app/features/home/domain/entity/brand_response/brand_entity.dart';

class BrandDTO extends BrandEntity {
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? statusMsg;

  String? message;
  BrandDTO({
    super.id,
    super.name,
    super.imageURL,
    this.statusMsg,
    this.message,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  factory BrandDTO.fromJson(Map<String, dynamic> json) => BrandDTO(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        statusMsg: json['statusMsg'] as String?,
        message: json['message'] as String?,
        imageURL: json['image'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );
}
