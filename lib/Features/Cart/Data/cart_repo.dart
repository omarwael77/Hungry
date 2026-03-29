// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print

import 'package:hungry_resturant/Features/Cart/Data/cart_model.dart';
import 'package:hungry_resturant/core/network/api_service.dart';

class CartRepo {
  final ApiService _apiService =ApiService();

// !Add To Cart
  Future<void>AddToCart(CartRequestModel cartData)async{
    try {
      final response = await _apiService.post(
                  "/cart/add",  cartData.toJson() );
   print("Add To Cart Successfully, response: $response");
    } catch (e) {
     print("Server response error: ${e.toString()}");
    }

  }
}