import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      List<Product> products = await ApiService().fetchProducts();
      _products = products;
    } catch (e) {
      // Handle error
    }
    _isLoading = false;
    notifyListeners();
  }
}
