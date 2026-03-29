import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_resturant/Features/Home/Data/productRepo.dart';
import 'product_state.dart';


class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final ProductRepo _repo = ProductRepo();

  Future<void> getProducts() async {
    emit(ProductLoading());

    try {
      final products = await _repo.getProducts();

      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}