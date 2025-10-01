class ProductCartEntity {
  int? count;
  String? id;
  // ProductCartEntity? products;
  int? price;
  final String title;
  final String coverImageURL;
  final double ratingsAverage;

  ProductCartEntity({
    this.count,
    this.id,
    this.price,
    required this.title,
    required this.coverImageURL,
    required this.ratingsAverage,
  });
}
