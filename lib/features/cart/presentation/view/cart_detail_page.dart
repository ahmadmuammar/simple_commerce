import 'package:flutter/material.dart';
import 'package:simple_commerce/core/core.dart';
import 'package:simple_commerce/features/cart/data/data.dart';
import 'package:simple_commerce/features/cart/presentation/presentation.dart';

class CartDetailPage extends StatelessWidget {
  final List<Product> products;
  const CartDetailPage({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final cartBloc = di<CartBloc>();
    return Scaffold(
      appBar: AppBar(title: Text('Cart Detail')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return InkWell(
              onTap: () {
                cartBloc
                    .add(GetProductDetailsPressed(id: product.productId ?? 0));
                ProductDetailDialog.show(
                  context: context,
                  id: product.productId ?? 0,
                  bloc: cartBloc,
                );
              },
              child: Card(
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
              ),
            );
          },
        ),
      ),
    );
  }
}
