abstract class QuantityState {}

class QuantityInitial extends QuantityState {
  final int quantity;

  QuantityInitial(this.quantity);
}