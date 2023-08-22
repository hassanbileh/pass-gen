import 'package:flutter/material.dart';
import 'package:passgen/screens/screens.dart';

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
      body: CustomScrollView(
        slivers: [
          // header
          SliverToBoxAdapter(
              child: RegisterHeader(height: height, width: width)),

          //body
          SliverToBoxAdapter(
            child: RegisterBody(
              email: _email,
              password: _password,
              confirmPassword: _confirmPassword,
            ),
          ),

          //footer content
          SliverToBoxAdapter(
            child: RegisterFooter(
              onTapGoogle: () {},
              onTapFacebook: () {},
              onTapTwitter: () {},
            ),
          ),
        ],
      ),
    );
  }
}
