import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/models/Product_model.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<ProductModel> favorites = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite"), centerTitle: true),
      body: Center(child: Text("Hech narsa yoq")),
    );
  }
}
