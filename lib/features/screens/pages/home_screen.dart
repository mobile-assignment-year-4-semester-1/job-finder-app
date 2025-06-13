import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Static categories and products for demonstration
    final categories = [
      {'id': null, 'name': 'All Categories'},
      {'id': 1, 'name': 'Chairs'},
      {'id': 2, 'name': 'Tables'},
      {'id': 3, 'name': 'Sofas'},
    ];

    final products = [
      {
        'name': 'Modern Chair',
        'price': 120,
        'image_url': 'https://via.placeholder.com/180x135.png?text=Chair'
      },
      {
        'name': 'Classic Table',
        'price': 220,
        'image_url': 'https://via.placeholder.com/180x135.png?text=Table'
      },
      {
        'name': 'Luxury Sofa',
        'price': 350,
        'image_url': 'https://via.placeholder.com/180x135.png?text=Sofa'
      },
    ];

    int selectedCategoryIndex = 0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Discover The Best\nFurniture',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.shopping_cart, size: 32, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for furniture',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ChoiceChip(
                      label: Text(
                        categories[index]['name'] as String,
                        style: TextStyle(
                          color: selectedCategoryIndex == index
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                      selected: selectedCategoryIndex == index,
                      onSelected: (_) {},
                      selectedColor: Colors.black,
                      backgroundColor: Colors.grey[200],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Products List',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 225,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final dynamic product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 2,
        child: SizedBox(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Container(
                  width: double.infinity,
                  height: 135,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(product['image_url'] ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product['price']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
