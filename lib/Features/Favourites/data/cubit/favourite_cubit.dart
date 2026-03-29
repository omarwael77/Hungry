import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_resturant/Features/Home/Data/ProductModel.dart';


class FavouritesCubit extends Cubit<List<ProductModel>> {
  FavouritesCubit() : super([]);

  /// add / remove
  void toggleFavourite(ProductModel product) {
    final isExist = state.any((item) => item.id == product.id);

    if (isExist) {
      emit(
        state.where((item) => item.id != product.id).toList(),
      );
    } else {
      emit([...state, product]);
    }
  }

  /// check
  bool isFavourite(ProductModel product) {
    return state.any((item) => item.id == product.id);
  }
}