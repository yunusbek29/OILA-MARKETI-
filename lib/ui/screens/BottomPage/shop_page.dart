import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/BottomPage/detailPages/shop_page_grid.dart';
import 'package:flutter_application_1/ui/screens/BottomPage/detailPages/shop_page_list.dart';
import 'package:flutter_application_1/data/remote/fakestoreapi/product.dart';
import 'package:flutter_application_1/data/repository/models/Product_model.dart';
import 'package:flutter_application_1/ui/screens/pages/search_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool isOrder = false;
  bool isLoading = true;
  List<ProductModel> productmodel = [];

  @override
  void initState() {
    super.initState();
    getLoadList();
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
      body: Column(
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
                            isOrder = !isOrder;
                          });
                        },
                        icon: Icon(Icons.grid_view_outlined),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            isOrder = !isOrder;
                          });
                        },
                        icon: Icon(Icons.format_list_bulleted),
                      ),
              ],
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                      strokeAlign: 10,
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: isOrder
                            ? ListView.builder(
                                itemCount: productmodel.length,
                                itemBuilder: (context, index) {
                                  return ShopPageList(
                                    product: productmodel[index],
                                  );
                                },
                              )
                            : GridView.builder(
                                itemCount: productmodel.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                      childAspectRatio: 0.59,
                                    ),
                                itemBuilder: (context, index) {
                                  return ShopPageGrid(
                                    product: productmodel[index],
                                  );
                                },
                              ),
                      ),
                    ],
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
}
