// ignore_for_file: unused_local_variable, avoid_print, prefer_final_fields



import 'package:hungry_resturant/Features/Home/Data/ProductModel.dart';


import 'package:hungry_resturant/core/network/api_service.dart';

class ProductRepo{
  ApiService _apiService= ApiService();


  // !getProducts
Future<List<ProductModel?>> getProducts() async {
  try {
    final response = await _apiService.get( "/products"); 
    final List productsJson = response['data'] ?? [];
    final products = productsJson.map((e) => ProductModel.fromJson(e)).toList();
    return products;
  } catch (e) {
    print(e.toString());
    return [];
  }
}

  // !Search

  // !Cateory

 
}
