import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/widgets/button_loggin.dart';
import 'package:netflix_clone/widgets/text_field.dart';

class RegScreen extends StatelessWidget {
  const RegScreen({super.key});

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
              'Start your free30 days trial',
              style: GoogleFonts.aBeeZee(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50),
            const TextFiledReg(
                prefix: Icons.person, hitText: 'Enter your phone number'),
            const SizedBox(height: 20),
            const TextFiledReg(
                prefix: Icons.lock_outlined,
                hitText: 'Password',
                sefix: Icons.remove_red_eye),
            const SizedBox(height: 20),
            const TextFiledReg(
              prefix: Icons.lock_outlined,
              hitText: 'Repeat Password',
              sefix: Icons.remove_red_eye,
            ),
            const SizedBox(height: 50),
            SignBotton(
              color: const Color.fromARGB(255, 194, 24, 12),
              text: 'SIGN UP',
              onpress: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 20),
            SignBotton(
                color: Colors.transparent,
                text: 'SIGN IN',
                onpress: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
      ),
    );
  }
}
