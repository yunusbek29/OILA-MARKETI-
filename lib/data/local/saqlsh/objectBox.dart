
import 'package:flutter_application_1/data/repository/models/Product_model.dart';
import 'package:objectbox/objectbox.dart';


@Entity()
class Objectbox {
  @Id()
  int count;
  bool isLiked;
  List<ProductModel> bag;
  List<ProductModel> wishlist;


  Objectbox({  
    required this.count,
    required this.isLiked,
    required this.bag,
    required this.wishlist,
  });
}