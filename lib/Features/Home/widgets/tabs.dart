import 'package:flutter/material.dart';
import 'package:hungry_resturant/Theme/AppColor.dart';


class TabsBar extends StatefulWidget {
  const TabsBar({super.key});

  @override
  State<TabsBar> createState() => _TabsBarState();
}

class _TabsBarState extends State<TabsBar> {
  int selected = 0;

  List<String> tabs = [
    "All",
    "Comba",
    "Spicy",
    "Drinks",
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight*0.059,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        separatorBuilder: (context, index) => const SizedBox(width: 18),
        itemBuilder: (context, index) {
          bool active = selected == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selected = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: active ? AppColor.mainColor : Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  color: active ? Colors.white : AppColor.mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
