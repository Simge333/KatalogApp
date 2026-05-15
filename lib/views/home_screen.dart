import 'package:flutter/material.dart';
import 'package:katalogapp/components/product_card.dart';
import 'package:katalogapp/models/product_model.dart';
import 'package:katalogapp/services/api_service.dart';
import 'package:katalogapp/views/cart_screen.dart';
import 'package:katalogapp/views/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isLoading = false;
  List<Data> allProducts = [];
  ApiService apiService = ApiService();
  String errorMessage = "";
  Set<int> cartIds = {};

  Future<void> loadProducts() async {
    try {
      setState(() {
        isLoading = true;
      });
      final productModel = await apiService.fetchProducts();

      setState(() {
        allProducts = productModel.data ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Hata oluştu.";
      });
    }
  }

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.shopping_bag_outlined),
                    iconSize: 32,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen(products: allProducts, cartIds: cartIds)));
                    },
                  )
                ],
              ),
              const SizedBox(height: 8),

              const Text(
                'Find your perfect device.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 14),

              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search products',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),

              SizedBox(height: 16),

              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://wantapi.com/assets/banner.png",
                  width: double.infinity,
                  height: 80,
                  fit: BoxFit.fitWidth,
                ),
              ),

              SizedBox(height: 16),

              //ürünler-grid view
              Expanded(
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: allProducts.length,
                          itemBuilder: (context, index) {
                            final product = allProducts[index];
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailScreen(
                                                  product: product,
                                                  cartIds: cartIds)));
                                },
                                child: ProductCard(product: product));
                          },
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
