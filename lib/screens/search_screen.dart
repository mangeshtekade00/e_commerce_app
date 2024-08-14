import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Products'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (query) {
              // Implement search functionality
            },
            decoration: InputDecoration(
              hintText: 'Search...',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(productProvider.products[index].title),
                  leading: Image.network(productProvider.products[index].image),
                  trailing: Text('\$${productProvider.products[index].price}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
