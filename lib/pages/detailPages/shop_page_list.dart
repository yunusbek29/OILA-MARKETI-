import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/describsion_page.dart';
import 'package:flutter_application_1/pages/models/Product_model.dart';

class ShopPageList extends StatefulWidget {
  final ProductModel product;
  const ShopPageList({super.key, required this.product});

  @override
  State<ShopPageList> createState() => _ShopPageListState();
}

class _ShopPageListState extends State<ShopPageList> {
  bool isLiked = false;
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
                  imageUrl: widget.product.image,
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
                          widget.product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.product.category,
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        SizedBox(height: 4),
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
                            SizedBox(width: 4),
                            Text("(${widget.product.ratingCount})"),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          "${widget.product.price}\$",
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
                      child: isLiked
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  isLiked = false;
                                });
                              },
                              icon: Icon(Icons.favorite, color: Colors.red),
                            )
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  isLiked = true;
                                });
                              },
                              icon: Icon(Icons.favorite_border),
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
  }
}
