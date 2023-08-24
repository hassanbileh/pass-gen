import 'package:flutter/material.dart';
import 'package:passgen/widgets/widgets.dart';

class GenerateTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool? isTitle;
  final bool? hasMaxLines;
  final bool? isPassword;
  final bool? isObscure;
  final Widget? iconButton;
  const GenerateTextField({
    super.key,
    required this.controller,
    this.isTitle,
    this.hasMaxLines,
    required this.title,
    this.isPassword,
    this.isObscure,
    this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        (isTitle!)
            ? Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      padding: const EdgeInsets.all(10.0),
                      controller: controller,
                      hintText: 'Fill the ${title.toLowerCase()} here',
                      labelText: title,
                      isPassword: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FloatingActionButton(
                      elevation: 1.0,
                      onPressed: () {},
                      shape: const CircleBorder(),
                      child: const Icon(Icons.folder),
                    ),
                  ),
                ],
              )
            : (isPassword != null && isPassword != true)
                ? CustomTextField(
                    padding: const EdgeInsets.all(10.0),
                    controller: controller,
                    hintText: 'Fill the ${title.toLowerCase()} here',
                    labelText: title,
                    isPassword: false,
                  )
                : CustomTextField(
                    isObscure: isObscure,
                    iconButton: iconButton,
                    padding: const EdgeInsets.all(10.0),
                    controller: controller,
                    hintText: 'Fill the ${title.toLowerCase()} here',
                    labelText: title,
                    isPassword: true,
                  ),
      ],
    );
  }
}
