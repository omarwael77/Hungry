import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hungry_resturant/Features/Cart/cubit/quantity_cubit.dart';
import 'package:hungry_resturant/Shared/Widgts/elevatedButton.dart';
import 'package:hungry_resturant/Theme/AppColor.dart';

class itemCart extends StatelessWidget {
  final double screenWidth;
  final int productId;
  final int quantity;

  const itemCart({
    super.key,
    required this.screenWidth,
    required this.productId,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenWidth * 0.5,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          /// صورة المنتج + الاسم
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "Media/Cart2.png",
                  height: 70,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Hamburger Veggie Burger",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          /// التحكم في الكمية
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColor.mainColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () {
                          context.read<CartCubit>().increment(productId);
                        },
                        icon: const Icon(Icons.add, color: Colors.white, size: 22),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "$quantity",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColor.mainColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () {
                          context.read<CartCubit>().decrement(productId);
                        },
                        icon: const Icon(Icons.remove, color: Colors.white, size: 22),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                elevatedModel(
                  title: "Remove",
                  onPressed: () {
                    context.read<CartCubit>().removeItem(productId);
                  },
                  fore: Colors.white,
                  back: AppColor.mainColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}