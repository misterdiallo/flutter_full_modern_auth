import 'package:flutter/material.dart';
import 'package:flutter_full_modern_auth/constant/app_colors.dart';

class SocialLogoButon extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  const SocialLogoButon(
      {super.key, required this.url, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white),
        borderRadius: BorderRadius.circular(16),
        color: AppColors.grey[200],
      ),
      child: Image.asset(
        url,
        height: height,
        width: width,
      ),
    );
  }
}
