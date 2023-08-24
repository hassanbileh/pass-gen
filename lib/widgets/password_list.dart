import 'package:flutter/material.dart';
import 'package:passgen/models/password.dart';

class PasswordList extends StatelessWidget {
  final List<Password> passwords;
  final Function() onTap;

  const PasswordList({
    super.key,
    required this.passwords,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: passwords.length,
      itemBuilder: (context, index) {
        final password = passwords[index];
        return GestureDetector(
            onTap: onTap,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 40.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: AssetImage(password.imageUrl),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          password.title,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              password.username,
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                password.date,
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(
                  thickness: 0.5,
                ),
              ],
            ),
          );
        
        
      },
    );
  }
}
