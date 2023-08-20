import 'package:flutter/material.dart';
import 'package:passgen/widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            RegisterHeader(height: height, width: width),

            const SizedBox(
              height: 20.0,
            ),

            //body
            RegisterBody(
              email: _email,
              password: _password,
              confirmPassword: _confirmPassword,
            ),

            const SizedBox(
              height: 10.0,
            ),

            //footer content
            RegisterFooter(
              onTapGoogle: () {},
              onTapFacebook: () {},
              onTapTwitter: () {},
            ),
          ],
        ),
      ),
    );
  }
}
