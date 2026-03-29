import 'package:flutter/material.dart';
import 'package:hungry_resturant/Features/Favourites/view/favourite_view.dart';
import 'package:hungry_resturant/Features/Home/Data/ProductModel.dart';
import 'package:hungry_resturant/Features/Home/View/Home.dart';
import 'package:hungry_resturant/Features/Cart/View/Cart.dart';
import 'package:hungry_resturant/Features/auth/Screens/Profile.dart';
import 'package:hungry_resturant/Theme/AppColor.dart'; // لأنك مستخدم AppColor

// ==== CustomButtonVav ====
class CustomButtonVav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomButtonVav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final List<IconData> _icons = [
    Icons.home_filled,
    Icons.favorite,
    Icons.shopping_basket_outlined,
    Icons.person_outline,
  ];

  Widget _navItem(IconData icon, int index) {
    final bool isSelected = currentIndex == index;

    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 26,
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    const Color customDarkGreen = AppColor.mainColor;

    return Container(
      decoration: BoxDecoration(
        color: customDarkGreen,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: customDarkGreen.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      height: screenHeight * 0.07,
      width: screenWidth * 0.4,
      margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navItem(_icons[0], 0),
          _navItem(_icons[1], 1),
          _navItem(_icons[2], 2),
          _navItem(_icons[3], 3),
        ],
      ),
    );
  }
}

// ==== Root ====
class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const Favourite(  ),
    const Cart(),
    const Profile(),
  ];

  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: CustomButtonVav(
        currentIndex: currentIndex,
        onTap: _onTap,
      ),
    );
  }
}