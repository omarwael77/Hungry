// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_resturant/Features/Cart/View/Cart.dart';
import 'package:hungry_resturant/Features/Details/View/Details.dart';
import 'package:hungry_resturant/Features/Home/Data/Cubit/product_cubit.dart';
import 'package:hungry_resturant/Features/Home/Data/Cubit/product_state.dart';
import 'package:hungry_resturant/Features/Home/widgets/mainCart.dart';
import 'package:hungry_resturant/Features/Home/widgets/screachField.dart';
import 'package:hungry_resturant/Features/Home/widgets/tabs.dart';
import 'package:hungry_resturant/Features/auth/data/auth_repo/repo.dart';
import 'package:hungry_resturant/Theme/AppColor.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  bool isLoading = true;
  String userName = "Guest";

  final AuthRepo authRepo = AuthRepo();

  @override
  void initState() {
    super.initState();
    loadUserName();
  
  }

  Future<void> loadUserName() async {
    setState(() => isLoading = true);
    final user = await authRepo.autoLogin();
    setState(() {
      if (user != null) {
        userName = user.name;
      } else {
        userName = "Guest";
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Image.asset(
                    "Media/Hungry_.png",
                    width: screenWidth * 0.4,
                    color: AppColor.mainColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: AppColor.mainColor,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Text(
                      "Hello $userName",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
            ),

            const SizedBox(height: 20),

            searchFeild(),

            const SizedBox(height: 20),

            TabsBar(),

            const SizedBox(height: 20),

            // GridView للمنتجات
            Expanded(
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ProductError) {
                    return Center(
                      child: Text(
                        state.error,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  if (state is ProductSuccess) {
                    final products = state.products;

                    // Debug
                    print('عدد المنتجات: ${products.length}');

                    return GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];

                        return mainCard(product: product);
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
     
    );
  }
}