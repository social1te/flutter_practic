import 'package:flutter/material.dart';
import 'package:practice_with_zub/src/repository/constants/colors.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({Key? key, required this.hintText}) : super(key: key);
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.raisinBlack, width: 2.5),
            borderRadius: BorderRadius.circular(8)),
        fillColor: Colors.grey.shade100,
        hintStyle: const TextStyle(color: Colors.black),
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey, width: 1)),
      ),
    );
  }
}
