import 'package:alif_e_commerce/data/repositories/product/product_repository.dart';
import 'package:alif_e_commerce/features/shop/models/product_model.dart';
import 'package:alif_e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      //show loader where loaders
      isLoading.value = true;
      print("sampai sini");
      //fetch product
      final products = await productRepository.getFeaturedProduct();
      print("ok");
      //assign product
      featuredProducts.assignAll(products);
    } catch (e) {
      print("Error: $e");
      BLoaders.errorSnackBar(title: "Sorry guys ya", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
