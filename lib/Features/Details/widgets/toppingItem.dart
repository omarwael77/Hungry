import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_resturant/Features/Details/Data/cubit/topping_cubit.dart';
import 'package:hungry_resturant/Features/Details/Data/cubit/topping_state.dart';

class ToppingItem extends StatelessWidget {
  final int id;
  final String imagePath;
  final String title;
  final bool isToppingItem; // true: toppings, false: sideOptions

  const ToppingItem({
    super.key,
    required this.id,
    required this.imagePath,
    required this.title,
    required this.isToppingItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: Image.network(imagePath, fit: BoxFit.cover),
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 6,
            right: 6,
            child: BlocBuilder<ToppingCubit, ToppingState>(
              builder: (context, state) {
                if (state is! ToppingLoaded) return const SizedBox();

                final isSelected = isToppingItem
                    ? state.selectedToppings.contains(id)
                    : state.selectedSideOptions.contains(id);

                return GestureDetector(
                  onTap: () {
                    if (isToppingItem) {
                      context.read<ToppingCubit>().toggleTopping(id);
                    } else {
                      context.read<ToppingCubit>().toggleSideOption(id);
                    }
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor:
                        isSelected ? Colors.green : Colors.grey[100],
                    child: Icon(
                      isSelected ? Icons.check : Icons.add,
                      color: isSelected ? Colors.white : Colors.red[900],
                      size: 20,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}