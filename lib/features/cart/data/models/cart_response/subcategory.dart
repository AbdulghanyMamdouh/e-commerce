class Subcategory {
  String? id;
  String? name;
  String? slug;
  String? category;

  Subcategory({this.id, this.name, this.slug, this.category});

  factory Subcategory.fromMap(Map<String, dynamic> data) => Subcategory(
        id: data['_id'] as String?,
        name: data['name'] as String?,
        slug: data['slug'] as String?,
        category: data['category'] as String?,
      );
}
