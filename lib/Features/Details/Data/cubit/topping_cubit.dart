import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_resturant/Features/Details/Data/ToppingsRepo.dart';
import 'topping_state.dart';

class ToppingCubit extends Cubit<ToppingState> {
  final toppingRepo repo;

  ToppingCubit(this.repo) : super(ToppingInitial());

  /// تحميل الـ toppings والـ side options
  Future<void> fetchAll() async {
    emit(ToppingLoading());
    try {
      final toppings = await repo.getToppings();
      final sideOptions = await repo.getSideOptions();

      emit(
        ToppingLoaded(
          toppings: toppings,
          sideOptions: sideOptions,
          selectedToppings: [],
          selectedSideOptions: [],
        ),
      );
    } catch (e) {
      emit(ToppingError(e.toString()));
    }
  }

  /// اختيار/إلغاء اختيار topping
  void toggleTopping(int toppingId) {
    if (state is! ToppingLoaded) return;

    final currentState = state as ToppingLoaded;
    final updatedSelected = List<int>.from(currentState.selectedToppings);

    if (updatedSelected.contains(toppingId)) {
      updatedSelected.remove(toppingId);
    } else {
      updatedSelected.add(toppingId);
    }

    emit(currentState.copyWith(selectedToppings: updatedSelected));
  }

  /// اختيار/إلغاء اختيار side option
  void toggleSideOption(int sideId) {
    if (state is! ToppingLoaded) return;

    final currentState = state as ToppingLoaded;
    final updatedSelected = List<int>.from(currentState.selectedSideOptions);

    if (updatedSelected.contains(sideId)) {
      updatedSelected.remove(sideId);
    } else {
      updatedSelected.add(sideId);
    }

    emit(currentState.copyWith(selectedSideOptions: updatedSelected));
  }
}