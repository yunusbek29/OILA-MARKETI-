import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/describsion_page.dart';
import 'package:flutter_application_1/pages/models/global_list.dart';

class BagPage extends StatefulWidget {
  const BagPage({super.key});

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  bool remove = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bag"), centerTitle: true,),
      body: ListView.builder(
        itemCount: bag.length,
        itemBuilder: (context, index) {
          final product = bag[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescribsionPage(product: product),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                        imageUrl: product.image,
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
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  bag.remove(product);
                                });
                              },
                              icon: Icon(Icons.remove_shopping_cart_sharp),
                              color: Colors.red,
                              iconSize: 24,
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
    );
  }
}
