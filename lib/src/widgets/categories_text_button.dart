import 'package:flutter/material.dart';

class CategoriesTextButton extends StatelessWidget {
  const CategoriesTextButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
            fontSize: 24, color: Colors.black, fontWeight: FontWeight.w300),
      ),
    );
  }
}
