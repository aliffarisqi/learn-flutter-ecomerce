import 'package:alif_e_commerce/data/repositories/banners/banner_repository.dart';
import 'package:alif_e_commerce/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController {
  //Variabels
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  //Update pages navigation dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  //fetch banner
  Future<void> fetchBanners() async {
    try {
      // Show Loader while loading banners
      isLoading.value = true;

      //fetch banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanner();

      //asign banners
      this.banners.assignAll(banners);
    } catch (e) {
      BLoaders.errorSnackBar(title: "Sorry guys", message: e.toString());
    } finally {
      //remove loaders
      isLoading.value = false;
    }
  }
}
