import 'package:flutter/material.dart';
import 'package:passgen/constants/assets/assets_constants.dart';
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
            //logo
            Center(
              child: Container(
                height: height * 0.20,
                width: width * 0.8,
                margin: EdgeInsets.only(top: height * 0.1, bottom: 5.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage(Assets.logo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
      
            const SizedBox(
              height: 20.0,
            ),
      
            const Text(
              'Register a master account',
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
      
            //Confirm Password textField
            CustomTextField(
              padding: EdgeInsets.only(
                left: MediaQuery.sizeOf(context).width * 0.1,
                right: MediaQuery.sizeOf(context).width * 0.1,
                bottom: 20.0,
              ),
              controller: _confirmPassword,
              hintText: 'Confirm your password',
              labelText: 'Confirm Password',
              isPassword: true,
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
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary)),
                ),
              ],
            ),
      
            const Row(
              children: [
                Expanded(
                    child: Divider(
                  thickness: 1.0,
                )),
                SizedBox(
                  width: 10.0,
                ),
                Text('Or continue with'),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: Divider(
                  thickness: 1.0,
                )),
              ],
            ),
            const SizedBox(height: 20.0,),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50.0,
                    width: 70.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(Assets.google),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
      
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50.0,
                    width: 70.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage(Assets.facebook),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
      
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50.0,
                    width: 70.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage(Assets.twitter),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
