import 'package:flutter/material.dart';

import 'package:flutter_full_modern_auth/constant/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final TextInputAction? action;
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.action = TextInputAction.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.next,
        autocorrect: false,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.grey.shade400,
            ),
          ),
          fillColor: AppColors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.grey[500]),
        ),
      ),
    );
  }
}
