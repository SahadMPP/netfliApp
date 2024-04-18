import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.roboto(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: const SizedBox(
                height: 110,
                width: 105,
                child: Image(
                    image: AssetImage(
                        'asset/netflixlogo.0.0.1466448626-removebg-preview (2).png'),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Sahad Mp',
              style: GoogleFonts.roboto(fontSize: 25),
            ),
            const SizedBox(height: 30),
            Container(
              height: 30,
              width: 240,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 57, 57, 57),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  'ALL METURITY RATINGS',
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 10,
                      color: const Color.fromARGB(255, 203, 203, 203)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const ProfileCard(
              leading: Icons.language,
              trilling: Icons.arrow_right,
              subtitle:
                  'Change the languge of text you seen on Netfilx',
              title: 'Display Language',
            ),
            const ProfileCard(
              leading: Icons.message,
              trilling: Icons.arrow_right,
              subtitle:
                  'Chouse the language you like to watch',
              title: 'Subtitle Language',
            ),
            const ProfileCard(
              leading: Icons.play_lesson_sharp,
              trilling: Icons.toggle_on,
              subtitle: 'On all drives',
              title: 'Autoplay Next Episod ',
            ),
            const ProfileCard(
              leading: Icons.play_arrow,
              trilling: Icons.toggle_on,
              subtitle: 'On all drives',
              title: 'Autoplay Previews',
            ),
            const ProfileCard(
              trilling: Icons.logout,
              title: 'LogOut',
            ),
          ],
        ),
      ),
    );
  }
}
