import 'package:flutter/material.dart';
import 'package:passgen/constants/assets/assets_constants.dart';
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
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RegisterHeader(height: height, width: width),
              const Text(
                'Login to your master account',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w200,
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
                controller: _email,
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
                controller: _password,
                hintText: 'Your password here',
                labelText: 'Password',
                isPassword: true,
              ),

              CustomButton(content: 'Login', onTap: () {}),

              const SizedBox(
                height: 10.0,
              ),

              Row(
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

              const SizedBox(height: 10.0,),

              RegisterFooter(
                onTapGoogle: () {},
                onTapFacebook: () {},
                onTapTwitter: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
