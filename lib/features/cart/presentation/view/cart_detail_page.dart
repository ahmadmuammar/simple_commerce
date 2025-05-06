import 'package:flutter/material.dart';
import 'package:simple_commerce/features/cart/data/data.dart';

class CartDetailPage extends StatelessWidget {
  final List<Product> products;
  const CartDetailPage({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart Detail')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 12,
                  children: [
                    Text('Product ${product.productId.toString()}'),
                    Text('Qty: ${product.quantity}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
