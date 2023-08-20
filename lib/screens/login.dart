import 'package:flutter/material.dart';
import 'package:passgen/constants/assets/assets_constants.dart';
import 'package:passgen/data/data.dart';
import 'package:passgen/screens/screens.dart';
import 'package:passgen/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _email, _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _signIn(String email, String password) {
    bool emailExists = false;
    bool passwordExists = false;
    for (var i = 0; i < emails.length; i++) {
      if (emails[i] == email) {
        emailExists = true;
      }
    }
    for (var i = 0; i < passwords.length; i++) {
      if (passwords[i] == password) {
        passwordExists = true;
      }
    }

    if (emailExists && passwordExists) {
      print('logged succesfully');
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Assets.homeRoute, (route) => false);
    } else {
      print('wrong credentials');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: RegisterHeader(height: height, width: width),
            ),
            const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'Login to your master account',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),

            //Email textField
            SliverToBoxAdapter(
              child: CustomTextField(
                padding: EdgeInsets.only(
                  left: MediaQuery.sizeOf(context).width * 0.1,
                  right: MediaQuery.sizeOf(context).width * 0.1,
                  bottom: 10.0,
                  top: 20.0,
                ),
                controller: _email,
                hintText: 'Your email here',
                labelText: 'Email',
                isPassword: false,
              ),
            ),

            //Password textField
            SliverToBoxAdapter(
              child: CustomTextField(
                padding: EdgeInsets.only(
                  left: MediaQuery.sizeOf(context).width * 0.1,
                  right: MediaQuery.sizeOf(context).width * 0.1,
                  bottom: 10.0,
                ),
                controller: _password,
                hintText: 'Your password here',
                labelText: 'Password',
                isPassword: true,
              ),
            ),

            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text('mot de passe oublié ?',
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.primary)),
                    ),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(
              child: Center(
                child: CustomButton(
                    content: 'Login',
                    onTap: () =>
                        _signIn(_email.text.trim(), _password.text.trim())),
              ),
            ),

            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('You don\'t have an account ?'),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Assets.registerRoute, (route) => false);
                    },
                    child: Text('Register',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary)),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(
              child: RegisterFooter(
                onTapGoogle: () {},
                onTapFacebook: () {},
                onTapTwitter: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
