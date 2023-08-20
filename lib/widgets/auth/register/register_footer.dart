import 'package:flutter/material.dart';
import 'package:passgen/constants/assets/assets_constants.dart';

class RegisterFooter extends StatelessWidget {
  final Function() onTapGoogle, onTapFacebook, onTapTwitter;
  const RegisterFooter({
    super.key,
    required this.onTapGoogle,
    required this.onTapFacebook,
    required this.onTapTwitter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: onTapGoogle,
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
              onTap: onTapFacebook,
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
              onTap: onTapTwitter,
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
    );
  }
}
