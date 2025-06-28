import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/BottomPage/main_page.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController? _controller;
  double duration = 10;

  @override
  void initState() {
    super.initState();
    startTimer();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/animation.json',
              height: 300,
              width: 300,
              fit: BoxFit.cover,
              controller: _controller,
              onLoaded: (compasition) {
                _controller?.duration = compasition.duration;
              },
            ),
            SizedBox(height: 10),
            Text(
              "Oila Marketi",
              style: TextStyle(
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() async {
    await Future.delayed(_controller?.duration ?? Duration(seconds: 5));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    }
  }
}
