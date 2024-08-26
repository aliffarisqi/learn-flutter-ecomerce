import 'package:alif_e_commerce/features/shop/controllers/product/image_controller.dart';
import 'package:alif_e_commerce/features/shop/models/product_model.dart';
import 'package:alif_e_commerce/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  ///variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty.obs;

  //---select attribute and variation
  void onAttributeSelected(ProductModel product, attributeName, attributValue) {
    //when attribut is selected we will first add that attribute to the selected attribute to the selected attribut
    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributValue;
    this.selectedAttributes[attributeName] = attributValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) => _isSaneAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty,
    );

    //Show the selected Variation image as a Main Image
    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value = selectedVariation.image;
    }
    //asign selected variation
    this.selectedVariation.value = selectedVariation;
    getProductVariationStockstatus();
  }

  /// Check If selected attributes matches any variation attributes
  bool _isSaneAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    // If selectedAttributes contains 3 attributes and current variation contains 2 then return.
    if (variationAttributes.length != selectedAttributes.length) return false;

    // If any of the attributes is different then return. e.g. [Green, Large] × [Green, Small]
    for (final key in variationAttributes.keys) {
      // Attributes[Key] = Value which could be [Green, Small, Cotton] etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  // //---check attribute availability/stock in variation
  // Set<String> getAttributesAvailabilityVariation(List<ProductVariationModel> variations, String attributeName) {
  //   // Pass the variations to check which attributes are available and stock is not 0
  //   final availableVariationAttributeValues = variations
  //       .where((variation) =>
  //           // Check Empty / Out of Stock Attributes
  //           variation.attributeValues[attributeName] != null &&
  //           variation.attributeValues[attributeName]!.isNotEmpty &&
  //           variation.stock > 0)
  //       // Fetch all non-empty attributes of variations
  //       .map((variation) => variation.attributeValues[attributeName])
  //       .toSet();
  // }

// Check Attribute availability / Stock in Variation
  Set<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName) {
    // Pass the variations to check which attributes are available and stock is not 8
    final availableVariationAttributeValues = variations
        .where((variation) =>
// Check Empty / Out of Stock Attributes
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
// Fetch all non-empty attributes of variations
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributeValues;
  }

  /// -- Check Product Variation Stock Status
  void getProductVariationStockstatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  //get variation price
  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price)
        .toString();
  }

  /// --- Reset Selected Attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty;
  }
}
