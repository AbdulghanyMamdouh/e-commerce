import 'package:shopping_app/features/home/data/models/brand_response/brand_dto.dart';
import 'package:shopping_app/features/home/data/models/category_response/category_dto.dart';
import 'package:shopping_app/features/product/domain/entity/product_entity.dart';

class ProductDTO extends ProductEntity {
  ProductDTO({
    super.sold,
    super.images,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) => ProductDTO(
        sold: json['sold'] as int?,
        images: json['images'] as List<String>?,
        ratingsQuantity: json['ratingsQuantity'] as int?,
        id: json['_id'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        quantity: json['quantity'] as int?,
        price: json['price'] as int?,
        imageCover: json['imageCover'] as String?,
        category: json['category'] == null
            ? null
            : CategoryDTO.fromJson(json['category'] as Map<String, dynamic>),
        brand: json['brand'] == null
            ? null
            : BrandDTO.fromJson(json['brand'] as Map<String, dynamic>),
        ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      );
}
