import 'package:flutter/material.dart';

class SignBotton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onpress;

  const SignBotton({
    super.key,
    required this.color,
    required this.text,
    this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          side: const MaterialStatePropertyAll(
              BorderSide(width: 2, color: Color.fromARGB(255, 187, 19, 7))),
          backgroundColor: MaterialStatePropertyAll(color),
        ),
        onPressed: onpress,
        child: Text(
          text,
          style: const TextStyle(
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
