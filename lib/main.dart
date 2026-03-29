import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_resturant/Features/Cart/cubit/quantity_cubit.dart';
import 'package:hungry_resturant/Features/Favourites/data/cubit/favourite_cubit.dart';
import 'package:hungry_resturant/Features/Home/Data/Cubit/product_cubit.dart';
import 'package:hungry_resturant/Features/auth/data/Cubit/auth_cubit.dart';
import 'package:hungry_resturant/Features/auth/data/auth_repo/repo.dart';
import 'package:hungry_resturant/Features/splashscreen/Splashview.dart';

void main() {
  runApp(const Hungry());
}

class Hungry extends StatelessWidget {
  const Hungry({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(AuthRepo()),
        ),
        BlocProvider<ProductCubit>(
          create: (_) => ProductCubit()..getProducts(),
        ),
        BlocProvider<FavouritesCubit>(
          create: (_) => FavouritesCubit(),
        ),
        BlocProvider<CartCubit>(
          create: (_) => CartCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}