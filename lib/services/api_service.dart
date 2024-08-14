import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  final String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> fetchProducts({int limit = 10, int skip = 0}) async {
    final response = await http.get(Uri.parse('$baseUrl?limit=$limit&skip=$skip'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
