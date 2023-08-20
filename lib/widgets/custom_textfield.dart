import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool isPassword;
  const CustomTextField({
    super.key,
    required this.padding,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return !isPassword
        ? //Email textField
        Padding(
            padding: padding,
            child: TextField(
              controller: controller,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: hintText,
                labelText: labelText,
              ),
            ),
          )
        : //Password textField
        Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width * 0.1,
              right: MediaQuery.sizeOf(context).width * 0.1,
              bottom: 10.0,
            ),
            child: TextField(
              controller: controller,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: hintText,
                labelText: labelText,
              ),
            ),
          );
  }
}
