import 'package:flutter/material.dart';

typedef HidePassword = bool Function()?;

class CustomTextField extends StatelessWidget {
  final Widget? iconButton;
  final EdgeInsetsGeometry padding;
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool? isPassword;
  final bool? isObscure;
  final Function(String)? onSubmitted;
  const CustomTextField({
    super.key,
    required this.padding,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.isPassword,
    this.onSubmitted,
    this.isObscure, this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
   
    return (isPassword != null && isPassword != true && iconButton == null)
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
            padding: padding,
            child: TextField(
              controller: controller,
              obscureText: (isObscure ?? true),
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
                suffixIcon: iconButton,
              ),
              onSubmitted: onSubmitted,
            ),
          );
  }
}
