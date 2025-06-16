import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/models/user_model.dart';

import '../fakestoreapi/product.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel? userModel;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    requestBacend();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  onPressed: () {},
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'My orders',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
                          'Shipping addresses',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
                          'Payment methods',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
                          'Promotion condes',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
                          'My reviews',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
                          'Setings',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
              ],
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
