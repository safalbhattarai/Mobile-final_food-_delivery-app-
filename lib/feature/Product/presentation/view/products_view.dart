import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockvision_app/app/di/di.dart';
import 'package:stockvision_app/feature/Order/presentation/view/single_product_view.dart';
import 'package:stockvision_app/feature/Order/presentation/view_model/order/bloc/order_bloc.dart';
import 'package:stockvision_app/feature/Product/presentation/view/recipe_page.dart';
import 'package:stockvision_app/feature/Product/presentation/view_model/bloc/product_bloc.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  String? selectedType;
  double maxPrice = 100000; // Default max price for filtering
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context
        .read<ProductBloc>()
        .add(GetAllProduct()); // Fetch products initially
  }

  @override
  Widget build(BuildContext context) {
    // Predefined products if no products are fetched
    final List<Map<String, String>> predefinedProducts = [
      {
        'title': 'Yomari',
        'description': 'This is Yomari description',
        'imageUrl': 'assets/images/yomari.jpg',
      },
      {
        'title': 'Kimchi',
        'description': 'This is Kimchi description.',
        'imageUrl': 'assets/images/kimchi.jpg',
      },
      {
        'title': 'Salad',
        'description': 'This is salad description',
        'imageUrl': 'assets/images/salad.jpg',
      },

      // {
      //   'title': 'Pizza',
      //   'description': 'This is Pizza description',
      //   'imageUrl': 'assets/images/8.jpg',
      // },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Recipe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreateRecipePage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.product.isEmpty) {
              // Display predefined products if no products are fetched
              return ListView.builder(
                itemCount: predefinedProducts.length,
                itemBuilder: (BuildContext context, index) {
                  final product = predefinedProducts[index];

                  return Card(
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: InkWell(
                      onTap: () {
                        print('Predefined Product: ${product['title']}');
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            product['imageUrl']!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          product['title']!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        subtitle: Text(
                          product['description']!,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black54),
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            // Apply filters and search to the fetched products
            final filteredProducts = state.product
                .where((product) =>
                    (selectedType == null || product.type == selectedType) &&
                    (double.tryParse(product.price) ?? 0) <= maxPrice &&
                    (product.productName
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase())))
                .toList();

            return Column(
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search products...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(height: 10),

                // Product List
                Expanded(
                  child: filteredProducts.isEmpty
                      ? const Center(child: Text("No products found"))
                      : ListView.builder(
                          itemCount: filteredProducts.length,
                          itemBuilder: (BuildContext context, index) {
                            final product = filteredProducts[index];

                            final String imageFileName =
                                product.image?.split('/').last ?? "";
                            final String baseUrl = Platform.isIOS
                                ? "http://127.0.0.1:3000"
                                : "http://10.0.2.2:3000";
                            final String imageUrl =
                                "$baseUrl/uploads/$imageFileName";

                            return Card(
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => BlocProvider(
                                        create: (context) => getIt<OrderBloc>(),
                                        child: ProductDetailView(
                                          product: product,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(10),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      imageUrl,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(
                                          Icons.image_not_supported,
                                          size: 80,
                                          color: Colors.grey,
                                        );
                                      },
                                    ),
                                  ),
                                  title: Text(
                                    product.productName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  subtitle: Text(
                                    "Rs: ${product.price}",
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
