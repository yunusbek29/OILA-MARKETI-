import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/BottomPage/bag_page.dart';
import 'package:flutter_application_1/data/repository/models/user_model.dart';
import 'package:flutter_application_1/ui/screens/BottomPage/favorite_page.dart';
import 'package:flutter_application_1/ui/screens/settings/setting.dart';

import '../../../data/remote/fakestoreapi/product.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel? userModel;
  bool isLoading = false;
  bool showAddress = false;
  bool showTerms = false;

  @override
  void initState() {
    super.initState();
    requestBacend();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
                strokeAlign: 10,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 90),
                  Text(
                    "\t\tMy Profile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlie4MsQ9pJSSKY7DoEpxn3uBAq-rT7in1sA&s',
                          ),
                        ),
                        SizedBox(width: 10),
                        userModel != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(userModel?.username ?? ""),
                                  Text(userModel?.email ?? ""),
                                ],
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  MaterialButton(
                    height: 50,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BagPage()),
                      );
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'My bag',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  MaterialButton(
                    height: 50,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FavoritePage()),
                      );
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Wishlist',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  MaterialButton(
                    height: 50,
                    onPressed: () {
                      setState(() {
                        showAddress = !showAddress;
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Shipping addresses',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(
                          showAddress
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: showAddress,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name: ${userModel!.username}",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Email: ${userModel!.email}",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Password: ${userModel!.password}",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Address: ${userModel!.address.city}",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Phone: ${userModel!.phone}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  MaterialButton(
                    height: 50,
                    onPressed: () {
                      setState(() {
                        showTerms = !showTerms;
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Terms of Use',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(
                          showTerms
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: showTerms,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        bottom: 8,
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1. Ushbu ilovadan faqat qonuniy maqsadlarda foydalaning.",
                            ),
                            SizedBox(height: 5),
                            Text(
                              "2. Profil ma'lumotlaringizni maxfiy saqlang.",
                            ),
                            SizedBox(height: 5),
                            Text(
                              "3. Narxlar va mahsulotlar o'zgarishi mumkin.",
                            ),
                            SizedBox(height: 5),
                            Text(
                              "4. Yetkazib berishdagi kechikishlar uchun biz mas'ul emasmiz.",
                            ),
                            SizedBox(height: 5),
                            Text(
                              "5. Sizning ma'lumotlaringiz bizning Maxfiylik siyosatimiz asosida himoyalangan.",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  MaterialButton(
                    height: 50,
                    onPressed: () {
                      if (userModel != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Setting(userModel: userModel!),
                          ),
                        );
                      }
                    },

                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Setings',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void requestBacend() async {
    setState(() {
      isLoading = true;
    });
    final response = await Product.GET('${Product.GET_USER}/2', {});
    final user = UserModel.fromJson(jsonDecode(response.toString()));
    userModel = user;
    setState(() {
      isLoading = false;
    });
  }
}
