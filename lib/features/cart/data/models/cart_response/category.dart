class Category {
  String? id;
  String? name;
  String? slug;
  String? image;

  Category({this.id, this.name, this.slug, this.image});

  factory Category.fromMap(Map<String, dynamic> data) => Category(
        id: data['_id'] as String?,
        name: data['name'] as String?,
        slug: data['slug'] as String?,
        image: data['image'] as String?,
      );
}
