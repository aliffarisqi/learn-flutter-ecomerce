import 'package:alif_e_commerce/features/shop/models/category_model.dart';
import 'package:alif_e_commerce/utils/constants/images_strings.dart';

class BDummyData {
  //BANNERS

  //CATEGORY
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', image: BImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(id: '5', image: BImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: '2', image: BImages.electronicsIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: '3', image: BImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(id: '4', image: BImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(id: '6', image: BImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '7', image: BImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(id: '14', image: BImages.jeweleryIcon, name: 'Jewelery', isFeatured: true),

    ///SUB CATEGORY
    CategoryModel(id: '8', image: BImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: BImages.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: BImages.sportIcon, name: 'Sports Equipments', parentId: '1', isFeatured: false),

    CategoryModel(id: '11', image: BImages.furnitureIcon, name: 'Bedroom furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '12', image: BImages.furnitureIcon, name: 'Kitchen furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '13', image: BImages.furnitureIcon, name: 'Office furniture', parentId: '5', isFeatured: false),
    //electronics
    CategoryModel(id: '14', image: BImages.electronicsIcon, name: 'Laptop', parentId: '2', isFeatured: false),
    CategoryModel(id: '15', image: BImages.electronicsIcon, name: 'Mobile', parentId: '2', isFeatured: false),

    CategoryModel(id: '16', image: BImages.clothIcon, name: 'Shirts', parentId: '3', isFeatured: false),
  ];
}
