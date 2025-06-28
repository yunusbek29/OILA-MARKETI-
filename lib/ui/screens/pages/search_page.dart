import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/data/remote/fakestoreapi/product.dart';
import 'package:flutter_application_1/data/repository/models/Product_model.dart';
import 'package:flutter_application_1/ui/screens/pages/describsion_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TextInputControl {
  TextEditingController controller = TextEditingController();
  List<ProductModel> allProducts = [];
  List<ProductModel> filteredProducts = [];
  bool isLoading = true;
  bool isEmpty = false;

  @override
  void initState() {
    super.initState();
    fetchProducts();
    isEmptys(isEmpty);
  }

  void isEmptys(bool isEmpty) {
    if (controller.text.isNotEmpty) {
      setState(() {
        isEmpty = true;
      });
    } else {
      setState(() {
        isEmpty = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isEmpty = false;
                controller.clear();
                fetchProducts();
              });
            },
            icon: Icon(Icons.clear, color: Colors.white),
          ),
        ],
        title: TextField(
          controller: controller,
          onChanged: filterSearch,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search by category...',
            hintStyle: TextStyle(color: Colors.white60),
            border: InputBorder.none,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : filteredProducts.isEmpty
          ? Center(
              child: Text(
                "No products found",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DescribsionPage(product: product),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsGeometry.only(
                              top: 10,
                              bottom: 10,
                              right: 10,
                              left: 10,
                            ),
                            child: Expanded(
                              child: CachedNetworkImage(
                                height: 100,
                                width: 100,
                                imageUrl: product.image,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      product.category,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        RatingBar.readOnly(
                                          initialRating: product.rate,
                                          maxRating: 5,
                                          filledIcon: Icons.star,
                                          emptyIcon: Icons.star_border,
                                          halfFilledIcon: Icons.star_half,
                                          filledColor: Colors.amber,
                                          size: 20,
                                        ),
                                        SizedBox(width: 4),
                                        Text("(${product.ratingCount})"),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "${product.price}\$",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
              },
            ),
    );
  }

  void fetchProducts() async {
    final response = await Product.GET(Product.GET_PRODUCT, {});
    if (response != null) {
      final List data = jsonDecode(response);
      allProducts = data.map((e) => ProductModel.fromJson(e)).toList();
      setState(() {
        filteredProducts = allProducts;
        isLoading = false;
      });
    }
  }

  void filterSearch(String query) {
    final results = allProducts.where((product) {
      return product.category.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredProducts = results;
    });
  }
}
