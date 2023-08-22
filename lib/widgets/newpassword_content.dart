import 'package:flutter/material.dart';
import 'package:passgen/widgets/widgets.dart';

class NewPasswordContent extends StatelessWidget {
  final TextEditingController title;
  const NewPasswordContent({
    super.key,
    required this.title,
    // required this.username,
    // required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PasswordTextField(
          title: 'Title',
          controller: title,
          isTitle: true,
        ),
        const SizedBox(
          height: 8.0,
        ),
        PasswordTextField(
          title: 'Username',
          controller: title,
          isTitle: false,
        ),
        const SizedBox(
          height: 8.0,
        ),
        PasswordTextField(
          title: 'Password',
          controller: title,
          isTitle: false,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Notes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                maxLines: 4,
                controller: TextEditingController(),
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: 'Add notes here',
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            Center(
              child: CustomButton(
                content: 'Save',
                onTap: () {},
              ),
            )
          ],
        ),
      ],
    );
  }
}
