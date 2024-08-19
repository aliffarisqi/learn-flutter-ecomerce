import 'package:alif_e_commerce/features/authentication/screens/login/login.dart';
import 'package:alif_e_commerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:alif_e_commerce/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:alif_e_commerce/features/authentication/screens/signup/signup.dart';
import 'package:alif_e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:alif_e_commerce/features/personalization/screens/address/address.dart';
import 'package:alif_e_commerce/features/personalization/screens/profile/profile.dart';
import 'package:alif_e_commerce/features/personalization/screens/settings/settings.dart';
import 'package:alif_e_commerce/features/shop/screens/cart/cart.dart';
import 'package:alif_e_commerce/features/shop/screens/checkout/checkout.dart';
import 'package:alif_e_commerce/features/shop/screens/order/order.dart';
import 'package:alif_e_commerce/features/shop/screens/store/store.dart';
import 'package:alif_e_commerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:alif_e_commerce/routes/routes.dart';
import 'package:get/get.dart';

import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/product_reviews/product_reviews.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: BRoutes.home, page: () => const HomeScreen()),
    GetPage(name: BRoutes.store, page: () => const StoreScreen()),
    GetPage(name: BRoutes.favourites, page: () => const FavoriteScreen()),
    GetPage(name: BRoutes.settings, page: () => const SettingScreen()),
    GetPage(name: BRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: BRoutes.order, page: () => const OrderScreen()),
    GetPage(name: BRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: BRoutes.cart, page: () => const CartScreen()),
    GetPage(name: BRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: BRoutes.userAddress, page: () => const AddressScreen()),
    GetPage(name: BRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: BRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: BRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: BRoutes.forgetPassword, page: () => const ForgotPassword()),
    GetPage(name: BRoutes.onBoarding, page: () => const OnboardingScreen()),

    // Add more  GetPage entries as needed
  ];
}
