import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/pages/describsion_page.dart';
import 'package:flutter_application_1/data/repository/models/global_list.dart';

class BagPage extends StatefulWidget {
  // final ProductModel product;
  const BagPage({
    super.key, //required this.product
  });

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  bool isEmpty = true;
  bool remove = false;
  int bagCounts = 1;

  @override
  initState() {
    super.initState();
    isEmptys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bag"), centerTitle: true),
      body: isEmpty
          ? Center(
              child: Text(
                "Your bag is empty",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: bagList.length,
                    itemBuilder: (context, index) {
                      final product = bagList[index];
                      return InkWell(
                        onTap: () async {
                          var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DescribsionPage(product: product),
                            ),
                          );
                          if (result == "setState") {
                            setState(() {});
                          }
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
                                  padding: EdgeInsetsGeometry.all(10),
                                  child: CachedNetworkImage(
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.orange,
                                        ),
                                      );
                                    },
                                    imageUrl: product.image,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                emptyColor: Colors.grey,
                                                size: 20,
                                              ),
                                              SizedBox(width: 4),
                                              Text("(${product.ratingCount})"),
                                            ],
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            "${product.price * product.count}\$",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        bottom: -10,
                                        left: 80,
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  product.count++;
                                                });
                                              },
                                              icon: Icon(
                                                Icons.add_shopping_cart,
                                                color: Colors.green,
                                              ),
                                              iconSize: 24,
                                            ),
                                            Text(
                                              "x${product.count}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.orange,
                                              ),
                                            ),
                                            IconButton(
                                              onLongPress: () {
                                                setState(() {
                                                  product.count = 1;
                                                });
                                              },
                                              onPressed: () {
                                                setState(() {
                                                  if (product.count > 1) {
                                                    product.count--;
                                                  } else {
                                                    bagList.removeAt(index);
                                                    isEmptys();
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                Icons.remove_shopping_cart,
                                                color: Colors.red,
                                              ),
                                              iconSize: 24,
                                            ),
                                          ],
                                        ),
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
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Total Product: ${bagList.length}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Total Price: \$${getTotalPrice().toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  void isEmptys() {
    if (bagList.isEmpty) {
      setState(() {
        isEmpty = true;
      });
    } else {
      setState(() {
        isEmpty = false;
      });
    }
  }

  double getTotalPrice() {
    double total = 0;
    for (var product in bagList) {
      total += product.price * product.count;
    }
    return total;
  }
}
