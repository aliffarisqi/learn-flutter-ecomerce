import 'package:alif_e_commerce/data/repositories/product/product_repository.dart';
import 'package:alif_e_commerce/features/shop/models/product_model.dart';
import 'package:alif_e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/enum.dart';

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

  /// Get the product price or price range for variations.
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // Jika produk tidak memiliki variasi, kembalikan harga biasa atau harga diskon jika ada
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else if (product.productVariations != null && product.productVariations!.isNotEmpty) {
      // Hitung harga terkecil dan terbesar di antara variasi
      for (var variation in product.productVariations!) {
        // Tentukan harga yang dipertimbangkan (harga diskon jika ada, jika tidak harga biasa)
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Perbarui harga terkecil dan terbesar
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      // Jika harga terkecil dan terbesar sama, kembalikan satu harga
      if (smallestPrice == largestPrice) {
        return smallestPrice.toString();
      } else {
        // Jika tidak, kembalikan rentang harga
        return '$smallestPrice - \$$largestPrice';
      }
    } else {
      // Jika produk adalah tipe variabel tetapi tidak memiliki variasi, kembalikan harga default
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    }
  }

  //calculate percentage
  String? calculateSalePrecentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0) return null;
    if (originalPrice <= 0) return null;
    double perecentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return perecentage.toStringAsFixed(0);
  }

  //check product status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out Of Stock';
  }
}
