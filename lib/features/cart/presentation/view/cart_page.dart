import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:simple_commerce/core/core.dart';
import 'package:simple_commerce/features/cart/presentation/presentation.dart';

import '../../../authentication/presentation/presentation.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _cartBloc = di<CartBloc>();

  @override
  void initState() {
    _cartBloc.add(GetAllCartTriggered());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false,
              );
            },
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => _cartBloc,
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadInProgress) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAllCartSuccess) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 18,
                  ),
                  itemCount: state.allCartResponse.length,
                  itemBuilder: (context, index) {
                    final cartItem = state.allCartResponse[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartDetailPage(
                              products: cartItem.products ?? [],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            spacing: 12,
                            children: [
                              Icon(Icons.shopping_cart_outlined),
                              Text(cartItem.id.toString()),
                              const Spacer(),
                              Text(
                                DateFormat('dd MMM yyyy').format(
                                  cartItem.date ?? DateTime.now(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is CartLoadFailure) {
              return Center(child: Text(state.errorMessage));
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
