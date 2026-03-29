import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<Map<int, int>> {
  // الخريطة: key = productId, value = quantity
  CartCubit() : super({});

  void addItem(int productId) {
    final currentQty = state[productId] ?? 0;
    emit({
      ...state,
      productId: currentQty + 1,
    });
  }

  void removeItem(int productId) {
    final newState = {...state};
    newState.remove(productId);
    emit(newState);
  }

  void increment(int productId) {
    final currentQty = state[productId] ?? 0;
    emit({
      ...state,
      productId: currentQty + 1,
    });
  }

  void decrement(int productId) {
    final currentQty = state[productId] ?? 0;
    if (currentQty > 1) {
      emit({
        ...state,
        productId: currentQty - 1,
      });
    } else {
      removeItem(productId);
    }
  }
}