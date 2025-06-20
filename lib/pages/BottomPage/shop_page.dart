import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/detailPages/shop_page_grid.dart';
import 'package:flutter_application_1/pages/detailPages/shop_page_list.dart';
import 'package:flutter_application_1/pages/fakestoreapi/product.dart';
import 'package:flutter_application_1/pages/models/Product_model.dart';
import 'package:flutter_application_1/pages/search_page.dart';
import 'package:flutter_application_1/pages/shared/shared_pref.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool isLiked = false;
  bool isOrder = false;
  bool isLoading = true;
  List<ProductModel> productmodel = [];

  @override
  void initState() {
    super.initState();
    getLoadList();
    toggleLike();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Products', style: TextStyle(color: Colors.orange)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            icon: Icon(Icons.search, color: Colors.orange),
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    children: [
                      Icon(Icons.filter_list),
                      Expanded(
                        flex: 1,
                        child: Text('Popular', style: TextStyle(fontSize: 16)),
                      ),
                      Expanded(flex: 4, child: Icon(Icons.swap_vert)),
                      isOrder
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  if (isOrder) {
                                    isOrder = false;
                                  } else {
                                    isOrder = true;
                                  }
                                });
                              },
                              icon: Icon(Icons.grid_view_outlined),
                            )
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  if (isOrder) {
                                    isOrder = false;
                                  } else {
                                    isOrder = true;
                                  }
                                });
                              },
                              icon: Icon(Icons.format_list_bulleted),
                            ),
                    ],
                  ),
                ),
                Expanded(
                  child: isOrder
                      ? ListView.builder(
                          itemCount: productmodel.length,
                          itemBuilder: (context, index) {
                            return ShopPageList(product: productmodel[index]);
                          },
                        )
                      : GridView.builder(
                          itemCount: productmodel.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                childAspectRatio: 0.65,
                              ),
                          itemBuilder: (context, index) {
                            return ShopPageGrid(product: productmodel[index]);
                          },
                        ),
                ),
              ],
            ),
    );
  }

  void getLoadList() async {
    setState(() {
      isLoading = true;
    });

    final respone = await Product.GET(Product.GET_PRODUCT, {});
    if (respone != null) {
      List jsonList = jsonDecode(respone);
      productmodel = jsonList.map((e) => ProductModel.fromJson(e)).toList();

      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void loadIsLiked() async {
    isLiked = await SharedPrefService.getBool('isLiked');
    setState(() {});
  }

  void toggleLike() async {
    isLiked = !isLiked;
    await SharedPrefService.saveBool('isLiked', isLiked);
    setState(() {});
  }
}
