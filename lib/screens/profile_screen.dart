import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
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
                  'Change the languge of text you seen on Netfilx cross all drives',
              title: 'Display Language',
            ),
            const ProfileCard(
              leading: Icons.message,
              trilling: Icons.arrow_right,
              subtitle:
                  'Chouse the language you like to watch, shows and movies in',
              title: 'Audio & Subtitle Language',
            ),
            const ProfileCard(
              leading: Icons.play_lesson_sharp,
              trilling: Icons.toggle_on_outlined,
              subtitle: 'On all drives',
              title: 'Autoplay Next Episod ',
            ),
            const ProfileCard(
              leading: Icons.play_arrow,
              trilling: Icons.toggle_on_outlined,
              subtitle: 'On all drives',
              title: 'Autoplay Previews',
            ),
          ],
        ),
      ),
    );
  }
}

// var isSelected1 = [false, true];

class ProfileCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leading;
  final IconData trilling;

  const ProfileCard({
    super.key,
    required this.leading,
    required this.subtitle,
    required this.title,
    required this.trilling,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 15, left: 15),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 34, 33, 33),
            borderRadius: BorderRadius.circular(12)),
        height: 100,
        child: Center(
          child: ListTile(
            iconColor: const Color.fromARGB(255, 218, 218, 218),
            leading: Icon(leading, size: 35),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            subtitle: Text(
              subtitle,
              style: GoogleFonts.roboto(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                wordSpacing: 3,
              ),
            ),
            trailing: Icon(trilling, size: 35),
            // trailing: ToggleButtons(children: [], isSelected: isSelected1),
          ),
        ),
      ),
    );
  }
}
