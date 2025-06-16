import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/BottomPage/bag_page.dart';
import 'package:flutter_application_1/pages/BottomPage/favorite_page.dart';
// import 'package:flutter_application_1/pages/BottomPage/home_page.dart';
import 'package:flutter_application_1/pages/BottomPage/profile_page.dart';
import 'package:flutter_application_1/pages/BottomPage/shop_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List<Widget> page = [
    // HomePage(),
    ShopPage(),
    BagPage(),
    FavoritePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentIndex],
      bottomNavigationBar: GNav(
        onTabChange: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        padding: EdgeInsetsGeometry.all(15),
        rippleColor: Colors.orange,
        tabBackgroundColor: Colors.grey.shade300,
        tabs: [
          // GButton(
          //   icon: Icons.home,
          //   onPressed: () {
          //     currentIndex == 0;
          //   },
          //   text: "Home",
          //   gap: 5,
          //   iconColor: Colors.grey,
          //   iconActiveColor: Colors.orange[400],
          //   textColor: Colors.orange[400],
          // ),
          GButton(
            icon: Icons.shopping_cart,
            text: "Shop",
            gap: 5,
            onPressed: () {
              currentIndex == 1;
            },
            iconColor: Colors.grey,
            iconActiveColor: Colors.orange[400],
            textColor: Colors.orange[400],
          ),
          GButton(
            icon: Icons.shopping_bag,
            text: "Bag",
            gap: 5,
            onPressed: () {
              currentIndex == 2;
            },
            iconColor: Colors.grey,
            iconActiveColor: Colors.orange[400],
            textColor: Colors.orange[400],
          ),
          GButton(
            icon: Icons.favorite,
            text: "Favorite",
            gap: 5,
            iconColor: Colors.grey,
            onPressed: () {
              currentIndex == 3;
            },
            iconActiveColor: Colors.orange[400],
            textColor: Colors.orange[400],
          ),
          GButton(
            icon: Icons.person,
            text: "profile",
            gap: 5,
            onPressed: () {
              currentIndex == 4;
            },
            iconColor: Colors.grey,
            iconActiveColor: Colors.orange[400],
            textColor: Colors.orange[400],
          ),
        ],
      ),
    );
  }
}
