import 'package:flutter/material.dart';

class SignBotton extends StatelessWidget {
  final String text;
  final Color color;

  const SignBotton({
    super.key,
    required this.color,
    required this.text,
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
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
