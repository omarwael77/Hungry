// ignore_for_file: non_constant_identifier_names, avoid_print, use_build_context_synchronously, unnecessary_underscores, must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_resturant/Features/Cart/Data/cart_model.dart';
import 'package:hungry_resturant/Features/Cart/Data/cart_repo.dart';
import 'package:hungry_resturant/Features/Cart/View/Cart.dart';
import 'package:hungry_resturant/Features/Cart/cubit/quantity_cubit.dart';
import 'package:hungry_resturant/Features/Details/Data/ToppingsRepo.dart';
import 'package:hungry_resturant/Features/Details/Data/cubit/topping_cubit.dart';
import 'package:hungry_resturant/Features/Details/Data/cubit/topping_state.dart';
import 'package:hungry_resturant/Features/Details/widgets/spiceSlider.dart';
import 'package:hungry_resturant/Features/Details/widgets/toppingItem.dart';
import 'package:hungry_resturant/Features/Home/Data/ProductModel.dart';
import 'package:hungry_resturant/Shared/Widgts/elevatedButton.dart';
import 'package:hungry_resturant/Theme/AppColor.dart';

class Details extends StatelessWidget {
  final ProductModel product;
  double spicyValue = 0.4;
  CartRepo cartRepo = CartRepo();

  Details({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ToppingCubit(toppingRepo())..fetchAll(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Center(
                  child: Image.network(product.image, height: 120),
                ),
                const SizedBox(height: 15),
                SpicySlider(onChanged: (val) => spicyValue = val),
                const SizedBox(height: 20),

                // ===== TOPPINGS =====
                const Text("Toppings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                const SizedBox(height: 15),
                SizedBox(
                  height: 100,
                  child: BlocBuilder<ToppingCubit, ToppingState>(
                    builder: (context, state) {
                      if (state is ToppingLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ToppingLoaded) {
                        final toppings = state.toppings;
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: toppings.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemBuilder: (_, index) {
                            final topping = toppings[index];
                            if (topping == null) return const SizedBox();
                            return ToppingItem(
                              id: topping.id,
                              imagePath: topping.image,
                              title: topping.name,
                              isToppingItem: true,
                            );
                          },
                        );
                      } else if (state is ToppingError) {
                        return Center(child: Text(state.error));
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // ===== SIDE OPTIONS =====
                const Text("Side options",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: BlocBuilder<ToppingCubit, ToppingState>(
                    builder: (context, state) {
                      if (state is ToppingLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ToppingLoaded) {
                        final sideOptions = state.sideOptions;
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: sideOptions.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemBuilder: (_, index) {
                            final side = sideOptions[index];
                            if (side == null) return const SizedBox();
                            return ToppingItem(
                              id: side.id,
                              imagePath: side.image,
                              title: side.name,
                              isToppingItem: false,
                            );
                          },
                        );
                      } else if (state is ToppingError) {
                        return Center(child: Text(state.error));
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),

        // ===== BOTTOM NAVIGATION =====
        bottomNavigationBar: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                   "\$"+product.price,
                    style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                 elevatedModel(
  title: "To-Cart",
  back: AppColor.mainColor,
  fore: Colors.white,
  onPressed: () {
    // إضافة المنتج للـ CartCubit
    context.read<CartCubit>().addItem(product.id);

    // تنقل لصفحة الكارت
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const Cart()),
    );
  },
)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}