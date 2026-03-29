import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_resturant/Features/Cart/cubit/quantity_cubit.dart';
import 'package:hungry_resturant/Features/Cart/widgets/itemCart.dart';
import 'package:hungry_resturant/Shared/Widgts/elevatedButton.dart';
import 'package:hungry_resturant/Theme/AppColor.dart';
import 'package:hungry_resturant/Features/Checkout_View/checkoutView.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, size: 35, color: Colors.black),
          ),
        ),
        title: const Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<CartCubit, Map<int, int>>(
                builder: (context, cartItems) {
                  if (cartItems.isEmpty) return const Center(child: Text("Cart is empty"));

                  return ListView(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    children: cartItems.entries.map((entry) {
                      return Column(
                        children: [
                          itemCart(
                            screenWidth: screenWidth,
                            productId: entry.key,
                            quantity: entry.value,
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    "Total\n19.25\$",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  elevatedModel(
                    title: "Pay-Now",
                    back: AppColor.mainColor,
                    fore: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CheckoutScreen()));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}