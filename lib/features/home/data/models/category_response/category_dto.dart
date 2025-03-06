import 'package:shopping_app/features/home/domain/entity/category_response/category_entity.dart';

class CategoryDTO extends CategoryEntity {
  String? slug;
  String? statusMsg;

  String? message;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryDTO({
    super.id,
    super.name,
    this.slug,
    super.imageURL,
    this.statusMsg,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => CategoryDTO(
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
