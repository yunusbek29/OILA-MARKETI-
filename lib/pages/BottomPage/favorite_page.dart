import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/models/Product_model.dart';
import 'package:flutter_application_1/pages/models/global_list.dart';
import 'package:flutter_application_1/pages/shared/sahred_pref.dart';

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
