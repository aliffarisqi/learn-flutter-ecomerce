import 'package:alif_e_commerce/data/repositories/categories/category_repository.dart';
import 'package:alif_e_commerce/features/shop/models/category_model.dart';
import 'package:alif_e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  ///--- Load category data
  Future<void> fetchCategories() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategoryModel();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(
        allCategories
            .where(
                (category) => category.isFeatured && category.parentId.isEmpty)
            .take(8)
            .toList(),
      );
    } catch (e) {
      BLoaders.errorSnackBar(title: "Sorry guys", message: e.toString());
    } finally {
      //remove loaders
      isLoading.value = false;
      print("categori list $featuredCategories");
    }
  }

  ///--- Load category selected data

  ///--- Get category or sub category data
}
