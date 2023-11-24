import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/loggin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin(context);
  }

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

  Future<void> checkLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoggingScreen(),
    ));
  }
}
