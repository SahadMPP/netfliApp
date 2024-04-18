import 'package:flutter/material.dart';

class TextFiledReg extends StatelessWidget {
  final String hitText;
  final IconData prefix;
  final IconData? sefix;
  final bool? isPassword;
  final TextEditingController? controller;

  const TextFiledReg({
    super.key,
    this.isPassword,
    required this.prefix,
    required this.hitText,
    this.sefix,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: TextField(
        obscureText: isPassword ?? false,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Icon(
                sefix,
                color: const Color.fromARGB(255, 80, 80, 80),
                size: 20,
              ),
            ),
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 77, 77, 77),
              fontSize: 16,
            ),
            hintText: hitText,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Icon(
                prefix,
                color: const Color.fromARGB(255, 80, 80, 80),
              ),
            )),
      ),
    );
  }
}
