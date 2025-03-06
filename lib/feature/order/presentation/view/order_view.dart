import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    // Predefined products list
    final List<Map<String, String>> predefinedProducts = [
      // {
      //   'title': 'Yomari',
      //   'description': 'This is Yomari description',
      //   'imageUrl': 'assets/images/yomari.jpg',
      // },
      // {
      //   'title': 'Kimchi',
      //   'description': 'This is Kimchi description.',
      //   'imageUrl': 'assets/images/kimchi.jpg',
      // },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: predefinedProducts.length,
          itemBuilder: (BuildContext context, index) {
            final product = predefinedProducts[index];

            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
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
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
