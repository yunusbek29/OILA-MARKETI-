import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/pages/describsion_page.dart';
import 'package:flutter_application_1/data/repository/models/Product_model.dart';

class ShopPageGrid extends StatefulWidget {
  final ProductModel product;
  const ShopPageGrid({super.key, required this.product});

  @override
  State<ShopPageGrid> createState() => _ShopPageGridState();
}

class _ShopPageGridState extends State<ShopPageGrid> {
  bool isLiked = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DescribsionPage(product: widget.product),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 2,
                        right: 4,
                      ),
                      child: Expanded(
                        child: CachedNetworkImage(
                          imageUrl: widget.product.image,
                          height: 150,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
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
                          "(${widget.product.ratingCount})",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${widget.product.title}...",
                      maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.product.category),
                    Text(
                      "${widget.product.price.toString()}\$",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
