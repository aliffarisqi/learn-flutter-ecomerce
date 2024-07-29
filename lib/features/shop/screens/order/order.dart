import 'package:alif_e_commerce/common/widget/appbar/appbar.dart';
import 'package:alif_e_commerce/features/shop/screens/order/widget/order_list.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BAppBar(
        title:
            Text("My Order", style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(BSizes.defaultSpace),
        //ORDERS
        child: OrderList(),
      ),
    );
  }
}
