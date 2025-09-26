import 'package:flutter/material.dart';
import 'package:shopping_app/features/cart/presentation/widget/product_cart_item.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (_, __) => ProductCartItem(),
            separatorBuilder: (_, __) => const SizedBox(
                  height: 8,
                ),
            itemCount: 3),
      ),
    );
  }
}
