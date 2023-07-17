import 'package:flutter/material.dart';

class LoginSocialButton extends StatelessWidget {
  const LoginSocialButton(
      {super.key, required this.imageAsset, required this.size});

  final String imageAsset;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Image.asset(
          imageAsset,
          height: size,
        ),
      ),
    );
  }
}
