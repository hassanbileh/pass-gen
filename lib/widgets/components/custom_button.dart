import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String content;
  final Function() onTap;
  const CustomButton({super.key, required this.content, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        alignment: const Alignment(0, 0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.black,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment(3.0, 0),
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(10), right: Radius.circular(10)),
        ),
        height: 50,
        width: MediaQuery.sizeOf(context).width * 0.65,
        child: Text(
          content,
          style: const TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
