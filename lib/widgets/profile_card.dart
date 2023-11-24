import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? leading;
  final IconData trilling;

  const ProfileCard({
    super.key,
    this.leading,
    this.subtitle,
    required this.title,
    required this.trilling,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 15, left: 15),
      child: Container(
        padding: const EdgeInsets.all(3),
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
            subtitle: subtitle != null
                ? Text(
                    subtitle!,
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      wordSpacing: 3,
                    ),
                  )
                : null,
            trailing: Icon(trilling, size: 35),
          ),
        ),
      ),
    );
  }
}
