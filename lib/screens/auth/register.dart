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
  bool isHidden = false;
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
              isObscure: isHidden,
              iconButton: IconButton(
                onPressed: () {
                  setState(() {
                    if (isHidden) {
                      isHidden = false;
                    }else{
                      isHidden = true;
                    }
                  });
                
                },
                icon: (!isHidden)
                    ? const Icon(Icons.remove_red_eye)
                    : const Icon(Icons.visibility_off),
              ),
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
