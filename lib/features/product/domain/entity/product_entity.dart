import 'package:shopping_app/features/home/domain/entity/brand_response/brand_entity.dart';
import 'package:shopping_app/features/home/domain/entity/category_response/category_entity.dart';

class ProductEntity {
  int? sold;
  List<String>? images;

  int? ratingsQuantity;
  String? id;
  String? title;

  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryEntity? category;
  BrandEntity? brand;
  double? ratingsAverage;

  ProductEntity({
    this.sold,
    this.images,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });
}
