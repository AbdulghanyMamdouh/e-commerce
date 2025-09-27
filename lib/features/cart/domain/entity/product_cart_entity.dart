class ProductCartEntity {
  int? count;
  String? id;
  ProductCartEntity? product;
  int? price;

  ProductCartEntity({this.count, this.id, this.product, this.price});

  factory ProductCartEntity.fromMap(Map<String, dynamic> data) =>
      ProductCartEntity(
        count: data['count'] as int?,
        id: data['_id'] as String?,
        product: data['product'] == null
            ? null
            : ProductCartEntity.fromMap(
                data['product'] as Map<String, dynamic>),
        price: data['price'] as int?,
      );
}
