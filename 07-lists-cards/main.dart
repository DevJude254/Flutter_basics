import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lists & Cards Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const ProductListPage(),
    );
  }
}

// Model class - represents a product
class Product {
  final String name;
  final String category;
  final double price;
  final String image; // emoji
  final int rating;
  final String description;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.rating,
    required this.description,
  });
}

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  // Sample data - in real apps, this comes from API or database
  final List<Product> products = [
    Product(
      name: 'Laptop Pro',
      category: 'Electronics',
      price: 1299.99,
      image: '💻',
      rating: 5,
      description: 'Powerful laptop for professionals',
    ),
    Product(
      name: 'Wireless Headphones',
      category: 'Electronics',
      price: 199.99,
      image: '🎧',
      rating: 4,
      description: 'Crystal clear sound quality',
    ),
    Product(
      name: 'Smart Watch',
      category: 'Electronics',
      price: 349.99,
      image: '⌚',
      rating: 4,
      description: 'Track your fitness goals',
    ),
    Product(
      name: 'Coffee Maker',
      category: 'Home',
      price: 89.99,
      image: '☕',
      rating: 5,
      description: 'Brew perfect coffee every time',
    ),
    Product(
      name: 'Running Shoes',
      category: 'Sports',
      price: 129.99,
      image: '👟',
      rating: 4,
      description: 'Comfortable and durable',
    ),
    Product(
      name: 'Backpack',
      category: 'Travel',
      price: 59.99,
      image: '🎒',
      rating: 5,
      description: 'Spacious and stylish',
    ),
    Product(
      name: 'Camera',
      category: 'Electronics',
      price: 899.99,
      image: '📷',
      rating: 5,
      description: 'Capture memories in 4K',
    ),
    Product(
      name: 'Book Collection',
      category: 'Books',
      price: 49.99,
      image: '📚',
      rating: 4,
      description: 'Best seller bundle pack',
    ),
    Product(
      name: 'Gaming Console',
      category: 'Electronics',
      price: 499.99,
      image: '🎮',
      rating: 5,
      description: 'Next-gen gaming experience',
    ),
    Product(
      name: 'Plant Set',
      category: 'Home',
      price: 29.99,
      image: '🪴',
      rating: 4,
      description: 'Brighten up your space',
    ),
  ];

  // Selected view type
  bool _isGridView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Store'),
        centerTitle: true,
        actions: [
          // Toggle between List and Grid view
          IconButton(
            icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
            tooltip: _isGridView ? 'List View' : 'Grid View',
          ),
        ],
      ),
      body: _isGridView ? _buildGridView() : _buildListView(),
    );
  }

  // List View with Cards
  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            
            // Left side - Product emoji
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                product.image,
                style: const TextStyle(fontSize: 32),
              ),
            ),
            
            // Middle - Product info
            title: Text(
              product.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  product.description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    // Category badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        product.category,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.teal[900],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Star rating
                    ...List.generate(
                      5,
                      (i) => Icon(
                        i < product.rating ? Icons.star : Icons.star_border,
                        size: 16,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            // Right side - Price
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 4),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
            
            // On tap action
            onTap: () {
              _showProductDetails(product);
            },
          ),
        );
      },
    );
  }

  // Grid View with Cards
  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns
        childAspectRatio: 0.75, // Height/Width ratio
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        
        return Card(
          elevation: 3,
          child: InkWell(
            onTap: () => _showProductDetails(product),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Product emoji
                  Text(
                    product.image,
                    style: const TextStyle(fontSize: 48),
                  ),
                  const SizedBox(height: 8),
                  
                  // Product name
                  Text(
                    product.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  
                  // Category
                  Text(
                    product.category,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Star rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (i) => Icon(
                        i < product.rating ? Icons.star : Icons.star_border,
                        size: 14,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Price
                  Text(
                    '\${product.price}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Show product details in a dialog
  void _showProductDetails(Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Text(product.image, style: const TextStyle(fontSize: 32)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                product.name,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Category: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(product.category),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Price: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  '\${product.price}',
                  style: const TextStyle(
                    color: Colors.teal,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Rating: ', style: TextStyle(fontWeight: FontWeight.bold)),
                ...List.generate(
                  5,
                  (i) => Icon(
                    i < product.rating ? Icons.star : Icons.star_border,
                    size: 18,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${product.name} added to cart! 🛒'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
            label: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}