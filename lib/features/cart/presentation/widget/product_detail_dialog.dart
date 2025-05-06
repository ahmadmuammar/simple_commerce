import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_commerce/features/cart/presentation/presentation.dart';

class ProductDetailDialog {
  static Future<void> show({
    required BuildContext context,
    required int id,
    required CartBloc bloc,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Product Details'),
          content: SingleChildScrollView(
            child: BlocBuilder<CartBloc, CartState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is GetProductDetailsSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Image.network(
                        state.productDetailsResponse.image ?? '',
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                      ),
                      Text(state.productDetailsResponse.title ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                          'Category: ${state.productDetailsResponse.category}'),
                      Text(
                          'Price: ${state.productDetailsResponse.price.toString()}'),
                      Text(
                          'Rating: ${state.productDetailsResponse.rating?.rate}'),
                      Text(state.productDetailsResponse.description ?? ''),
                    ],
                  );
                } else if (state is CartLoadInProgress) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CartLoadFailure) {
                  return Text(state.errorMessage);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        );
      },
    );
  }
}
