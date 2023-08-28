import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passgen/bloc/generate_bloc.dart';
import 'package:passgen/screens/screens.dart';
import 'package:passgen/widgets/widgets.dart';
import 'dart:math';
import 'package:flutter/services.dart';

class GeneratorScreen extends StatefulWidget {
  const GeneratorScreen({super.key});

  @override
  State<GeneratorScreen> createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends State<GeneratorScreen> {
  String? _generatedPwd;
  double _length = 10.0;
  bool hasUpperCase = true;
  bool hasLowerCase = true;
  bool hasNumbers = false;
  bool hasSymbols = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Generate password',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              GeneratePasswordHeader(
                generatedPwd: _generatedPwd,
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomOptions(
                length: _length,
                isSlider: true,
                title: 'length: ',
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      const Text(
                        '4',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Slider.adaptive(
                          value: _length,
                          onChanged: (value) {
                            setState(() {
                              _length = value;
                            });
                          },
                          label: _length.toStringAsFixed(0).toString(),
                          min: 4,
                          max: 32,
                        ),
                      ),
                      const Text('32'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomOptions(
                title: 'OPTIONS',
                child: PasswordOptions(
                    has: hasUpperCase,
                    onChanged: (value) {
                      setState(() {
                        hasUpperCase = value;
                      });
                    },
                    leading: 'A - Z',
                    trailing: 'Uppercase ( A to Z )'),
              ),
              CustomOptions(
                child: PasswordOptions(
                    has: hasLowerCase,
                    onChanged: (value) {
                      setState(() {
                        hasLowerCase = value;
                      });
                    },
                    leading: 'a - z',
                    trailing: 'Lowercase ( a to z )'),
              ),
              CustomOptions(
                child: PasswordOptions(
                    has: hasNumbers,
                    onChanged: (value) {
                      // setState(() {
                      //   hasNumbers = value;
                      // });
                      context.read<GenerateBloc>().add(SetNumbers(hasNumbers));
                    },
                    leading: '0 - 9',
                    trailing: 'Numbers ( 0 to 9 )'),
              ),
              CustomOptions(
                child: PasswordOptions(
                    has: hasSymbols,
                    onChanged: (value) {
                      setState(() {
                        hasSymbols = value;
                      });
                    },
                    leading: '!@\$^&',
                    trailing: 'Characters ( !@\$^& )'),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _length = 10.0;
                        hasUpperCase = false;
                        hasLowerCase = false;
                        hasNumbers = false;
                        hasSymbols = false;
                        _generatedPwd = null;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.restart_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CustomButton(
                    content: 'GENERATE',
                    onTap: () {
                      final pwd = generateRandomString(_length.toInt());
                      setState(() {
                        _generatedPwd = pwd;
                      });
                      print(pwd);
                      return _generatedPwd;
                    },
                  ),
                  GestureDetector(
                    onTap: (_generatedPwd != null)
                        ? () {
                            setState(() {
                              Clipboard.setData(ClipboardData(
                                text: _generatedPwd ?? '\n',
                              )).then(
                                (_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Copied to your clipboard !'),
                                    ),
                                  );
                                },
                              );
                            });
                          }
                        : () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('There\'s nothing to copy !'),
                                duration: Duration(seconds: 3),
                                showCloseIcon: true,
                              ),
                            );
                          },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.copy,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String generateRandomString(int len) {
  var r = Random();
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!@\$^&';
  return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
}
