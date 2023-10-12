import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passgen/cubits/cubit/switch_cubit.dart';
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
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasNumbers = false;
  bool hasSymbols = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SwitchCubit>(
        create: (context) => SwitchCubit(),
        child: SafeArea(
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
                const Note(),
                CustomOptions(
                  length: _length,
                  isSlider: true,
                  title: 'length: ',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        const Text(
                          '0',
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
                            min: 0,
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
                          hasUpperCase = value ? true : false;
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
                          hasLowerCase = value ? true : false;
                        });
                      },
                      leading: 'a - z',
                      trailing: 'Lowercase ( a to z )'),
                ),
                CustomOptions(
                  child: PasswordOptions(
                      has: hasNumbers,
                      onChanged: (value) {
                        setState(() {
                          hasNumbers = value ? true : false;
                        });
                      },
                      leading: '0 - 9',
                      trailing: 'Numbers ( 0 to 9 )'),
                ),
                CustomOptions(
                  child: PasswordOptions(
                      has: hasSymbols,
                      onChanged: (value) {
                        setState(() {
                          hasSymbols = value ? true : false;
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
                        final pwd = generateRandomString(_length.toInt(),
                            hasUpperCase, hasLowerCase, hasNumbers, hasSymbols);
                        setState(() {
                          _generatedPwd = pwd;
                        });
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
      ),
    );
  }
}

String? generateRandomString(int len, bool u, bool l, bool n, bool s) {
  var r = Random();
  const upChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const lwChars = 'abcdefghijklmnopqrstuvwxyz';
  const nbChars = '1234567890';
  const sbChars = '!@\$^&';

  if (u == true && l == true && n == true && s == true) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!@\$^&';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }else if(u == true && l == true && n != true && s != true){
    const strings = upChars + lwChars;
    return List.generate(len, (index) => strings[r.nextInt(strings.length)]).join();
  }else if(u == true && l == true && n == true && s != true){
    const mel = upChars + lwChars + nbChars;
    return List.generate(len, (index) => mel[r.nextInt(mel.length)]).join();
  }else if(u == true && l == true && n != true && s == true){
    const mel2 = upChars + lwChars + sbChars;
    return List.generate(len, (index) => mel2[r.nextInt(mel2.length)]).join();
  }else{
    return null;
  }
}
