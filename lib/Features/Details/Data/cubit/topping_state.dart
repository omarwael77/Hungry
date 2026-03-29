import 'package:hungry_resturant/Features/Details/Data/ToppingModel.dart';

abstract class ToppingState {}

class ToppingInitial extends ToppingState {}

class ToppingLoading extends ToppingState {}

class ToppingLoaded extends ToppingState {
  final List<ToppingModel?> toppings;
  final List<ToppingModel?> sideOptions;
  final List<int> selectedToppings;
  final List<int> selectedSideOptions;

  ToppingLoaded({
    required this.toppings,
    required this.sideOptions,
    required this.selectedToppings,
    required this.selectedSideOptions,
  });

  ToppingLoaded copyWith({
    List<ToppingModel?>? toppings,
    List<ToppingModel?>? sideOptions,
    List<int>? selectedToppings,
    List<int>? selectedSideOptions,
  }) {
    return ToppingLoaded(
      toppings: toppings ?? this.toppings,
      sideOptions: sideOptions ?? this.sideOptions,
      selectedToppings: selectedToppings ?? this.selectedToppings,
      selectedSideOptions: selectedSideOptions ?? this.selectedSideOptions,
    );
  }
}

class ToppingError extends ToppingState {
  final String error;
  ToppingError(this.error);
}