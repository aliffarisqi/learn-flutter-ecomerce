class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  //empty helper function
  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  //convert model to json
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  //map json factory
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['id'] ?? '',
      name: data['name'],
      image: data['image'],
      productsCount: data['ProductCount'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
    );
  }
}
