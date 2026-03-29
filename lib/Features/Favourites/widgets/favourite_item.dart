import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hungry_resturant/Features/Favourites/data/cubit/favourite_cubit.dart';
import 'package:hungry_resturant/Features/Home/Data/ProductModel.dart';


class favourite_item extends StatelessWidget {
  const favourite_item({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.product,
  });

  final double screenWidth;
  final double screenHeight;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight * 0.2,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1.5,
              color: Colors.black26,
            ),
          ),
          padding: const EdgeInsets.only(left:10),
          child: Row(
            children: [

              /// IMAGE + NAME
              Column(
                
                children: [
                  Image.network(
                    product.image,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              // const SizedBox(width: 15),

              /// DETAILS
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    const SizedBox(height: 4),
                    // Text(
                    //   "${product.price} \$",
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 12,
                    //     color: Colors.green,
                    //   ),
                    // ),
                  ],
                ),
              ),

              /// REMOVE FROM FAVOURITES
              IconButton(
                onPressed: () {
                  context
                      .read<FavouritesCubit>()
                      .toggleFavourite(product);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}