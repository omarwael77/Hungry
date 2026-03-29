abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List products;

  ProductSuccess(this.products);
}

class ProductError extends ProductState {
  final String error;

  ProductError(this.error);
}