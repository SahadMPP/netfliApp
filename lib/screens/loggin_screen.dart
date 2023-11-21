import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/widgets/button_loggin.dart';
import 'package:netflix_clone/widgets/text_field.dart';

class LoggingScreen extends StatelessWidget {
  const LoggingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Image.asset(
              'asset/netflixlogo.0.0.1466448626-removebg-preview (2).png',
              filterQuality: FilterQuality.high,
              height: 180,
            ),
            Text(
              'Enjoy the world of entertiment',
              style: GoogleFonts.aBeeZee(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50),
            const TextFiledReg(
                prefix: Icons.person, hitText: 'Enter your email'),
            const SizedBox(height: 20),
            const TextFiledReg(
                prefix: Icons.lock_outlined, hitText: 'Enter your Password'),
            const SizedBox(height: 50),
            const SignBotton(
                color: Color.fromARGB(255, 194, 24, 12), text: 'SIGN UP'),
            const SizedBox(height: 20),
            const SignBotton(color: Colors.transparent, text: 'SIGN UP'),
          ],
        ),
      ),
    );
  }
}
