import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_resturant/Features/Favourites/data/cubit/favourite_cubit.dart';
import 'package:hungry_resturant/Features/Favourites/widgets/favourite_item.dart';
import 'package:hungry_resturant/Features/Home/Data/ProductModel.dart';


class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Favourites",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),

      body: BlocBuilder<FavouritesCubit, List<ProductModel>>(
        builder: (context, favourites) {
          /// لو مفيش مفضلة
          if (favourites.isEmpty) {
            return const Center(
              child: Text(
                "No favourites yet ❤️",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            );
          }

          /// لو في بيانات
          return ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            itemCount: favourites.length,
            itemBuilder: (context, index) {
              return favourite_item(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                product: favourites[index],
              );
            },
          );
        },
      ),
    );
  }
}