import 'package:flutter/material.dart';
import 'package:passgen/constants/assets/assets_constants.dart';

class RegisterHeader extends StatelessWidget {
  final double height, width;
  const RegisterHeader({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height * 0.20,
        width: width * 0.8,
        margin: EdgeInsets.only(top: height * 0.1, bottom: 5.0),
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage(Assets.logo),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
