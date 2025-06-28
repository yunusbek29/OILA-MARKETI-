import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repository/models/Product_model.dart';
import 'package:flutter_application_1/data/repository/models/global_list.dart';

class DescribsionPage extends StatefulWidget {
  final ProductModel product;
  const DescribsionPage({super.key, required this.product});

  @override
  State<DescribsionPage> createState() => _DescribsionPageState();
}

class _DescribsionPageState extends State<DescribsionPage> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(widget.product.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, "setState");
          },
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: CachedNetworkImage(
                    width: MediaQuery.sizeOf(context).width,
                    imageUrl: widget.product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 1,
                  right: 8,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                        if (isLiked) {
                          bool isExist = favoriteList.any(
                            (element) => element.id == widget.product.id,
                          );
                          if (!isExist) {
                            favoriteList.add(widget.product);
                          }
                        } else {
                          favoriteList.removeWhere(
                            (element) => element.id == widget.product.id,
                          );
                        }
                      });
                    },
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.category,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Text(
                        "\$${widget.product.price}",
                        style: TextStyle(
                          color: Colors.green[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      RatingBar.readOnly(
                        initialRating: widget.product.rate,
                        maxRating: 5,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        halfFilledIcon: Icons.star_half,
                        filledColor: Colors.amber,
                        size: 20,
                      ),
                      Text(
                        "(${widget.product.ratingCount.toString()})",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.product.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {},
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Shipping info",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: () {},
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Support",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200),
          ],
        ),
      ),
     
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    addToBag(widget.product);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    "ADD TO BAG",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addToBag(ProductModel product) {
    final index = bagList.indexWhere((item) => item.id == product.id);

    if (index != -1) {
      bagList[index].count += 1; // Mahsulot bor — miqdorini oshir
    } else {
      bagList.add(product); // Mahsulot yo‘q — yangisini qo‘sh
    }
  }
}
