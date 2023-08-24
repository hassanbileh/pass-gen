import 'package:flutter/material.dart';
import 'package:passgen/constants/assets/assets_constants.dart';
import 'package:passgen/widgets/widgets.dart';

class RegisterBody extends StatelessWidget {
  final Widget? iconButton;
  final bool? isObscure;
  final TextEditingController email, password, confirmPassword;
  const RegisterBody({
    super.key,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.iconButton,
    this.isObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Register a master account',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
          ),
        ),

        const SizedBox(
          height: 5.0,
        ),

        //Email textField
        CustomTextField(
          padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width * 0.1,
            right: MediaQuery.sizeOf(context).width * 0.1,
            bottom: 10.0,
            top: 20.0,
          ),
          controller: email,
          hintText: 'Your email here',
          labelText: 'Email',
          isPassword: false,
        ),

        //Password textField
        CustomTextField(
          padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width * 0.1,
            right: MediaQuery.sizeOf(context).width * 0.1,
            bottom: 10.0,
          ),
          controller: password,
          hintText: 'Your password here',
          labelText: 'Password',
          isPassword: true,
          isObscure: isObscure,
          iconButton: iconButton,
        ),

        //Confirm Password textField
        CustomTextField(
          padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width * 0.1,
            right: MediaQuery.sizeOf(context).width * 0.1,
            bottom: 20.0,
          ),
          controller: confirmPassword,
          hintText: 'Confirm your password',
          labelText: 'Confirm Password',
          isPassword: true,
          isObscure: isObscure,
          iconButton: iconButton,
        ),

        CustomButton(content: 'Sign Up', onTap: () {}),

        const SizedBox(
          height: 10.0,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You\'ve an account ?'),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    Assets.loginRoute, (route) => false);
              },
              child: Text('Login',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
            ),
          ],
        ),
      ],
    );
  }
}
