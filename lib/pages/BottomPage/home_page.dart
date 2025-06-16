import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   body: Column(
      //     children: [
      //       Expanded(
      //         flex: 1,
      //         child: Image(image: AssetImage(''), fit: BoxFit.cover),
      //       ),
      //       Expanded(
      //         flex: 1,
      //         child: Row(
      //           children: [
      //             Expanded(
      //               child: Column(
      //                 children: [
      //                   Expanded(
      //                     flex: 1,
      //                     child: Center(
      //                       child: Text(
      //                         "Summer\nsale",
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 35,
      //                           color: Colors.red,
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                   Expanded(
      //                     flex: 1,
      //                     child: Image(image: AssetImage(''), fit: BoxFit.cover),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Expanded(
      //               flex: 1,
      //               child: Image(image: AssetImage(''), fit: BoxFit.cover),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
    );
  }
}
