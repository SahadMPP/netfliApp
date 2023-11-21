import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(
          image: AssetImage(
              'asset/netflixlogo.0.0.1466448626-removebg-preview (2).png'),
          filterQuality: FilterQuality.high,
          fit: BoxFit.fitHeight,
          height: 250,
        ),
      ),
    );
  }
}
