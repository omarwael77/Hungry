// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hungry_resturant/Features/Details/View/Details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_resturant/Features/Favourites/data/cubit/favourite_cubit.dart';
import 'package:hungry_resturant/Features/Home/Data/ProductModel.dart';


class mainCard extends StatelessWidget {
  final ProductModel product;

  const mainCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return  Container(
        decoration: BoxDecoration(color: Colors.white),
        height: screenHeight * 0.1,
        width: screenWidth * 0.4,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Details(
                  product: product, 
                ),
              ),
            );
          },
          child: Card(
            color: Colors.grey[300],
            elevation: 4,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                 
                  Image.network(
                    product.image,
                    height: 115,
                    fit: BoxFit.cover,
                  ),

                  
                  Text(
                    product.name,
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6,),

                  Row(
                    children: [
                      Text(
                        '⭐ ${product.rating}', // لو مفيش rating
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),

                      BlocBuilder<FavouritesCubit, List<ProductModel>>(
  builder: (context, favourites) {
    final isFav = favourites.any(
      (item) => item.id == product.id,
    );

    return IconButton(
      onPressed: () {
        context
            .read<FavouritesCubit>()
            .toggleFavourite(product);
      },
      icon: Icon(
        isFav ? Icons.favorite : Icons.favorite_border,
        color: isFav ? Colors.red : Colors.black,
        size: 27,
      ),
    );
  },
)
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
      
    
  }
}