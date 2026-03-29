
import 'package:hungry_resturant/Features/Details/Data/ToppingModel.dart';
import 'package:hungry_resturant/core/network/api_service.dart';

class toppingRepo{
  ApiService _apiService= ApiService();



   // !getToppings
  Future<List<ToppingModel?>> getToppings() async {
  try {
    final response = await _apiService.get("/toppings");

    final List toppingsJson = response['data'] ?? [];

    final toppings = toppingsJson.map((e) => ToppingModel.fromJson(e)).toList();

    return toppings;
  } catch (e) {
    print(e.toString());
    return []; 
  }
}
// !get sideoptains
Future<List<ToppingModel?>> getSideOptions() async {
  try {
    final response = await _apiService.get("/side-options");

    
    final List sideOptionsJson = response['data'] ?? [];

    
    final sideOptions = sideOptionsJson
        .map((e) => ToppingModel.fromJson(e))
        .toList();

    return sideOptions;
  } catch (e) {
    print(e.toString());
    return [];
  }
}}