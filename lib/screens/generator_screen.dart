import 'package:flutter/material.dart';
import 'package:passgen/widgets/widgets.dart';

class GeneratorScreen extends StatefulWidget {
  const GeneratorScreen({super.key});

  @override
  State<GeneratorScreen> createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends State<GeneratorScreen> {
  double _length = 10.0;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
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
              const _GenerateHeader(),
              const SizedBox(
                height: 20.0,
              ),
              _CustomOptions(
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
              _CustomOptions(
                title: 'OPTIONS',
                child: PasswordOptions(has: hasUpperCase, onChanged: (value){
                  setState(() {
                    hasUpperCase = value;
                  });
                }, leading: 'A - Z', trailing: 'Uppercase ( A to Z )'),
              ),
              _CustomOptions(
                child: PasswordOptions(has: hasLowerCase, onChanged: (value){
                  setState(() {
                    hasLowerCase = value;
                  });
                }, leading: 'a - z', trailing: 'Lowercase ( a to z )'),
              ),
              _CustomOptions(
                child: PasswordOptions(has: hasNumbers, onChanged: (value){
                  setState(() {
                    hasNumbers = value;
                  });
                }, leading: '0 - 9', trailing: 'Numbers ( 0 to 9 )'),
              ),
              _CustomOptions(
                child: PasswordOptions(has: hasSymbols, onChanged: (value){
                  setState(() {
                    hasSymbols = value;
                  });
                }, leading: '!@\$^&', trailing: 'Characters ( !@\$^& )'),
              ),
              Center(child: CustomButton(content: 'GENERATE', onTap: (){}))
            ],
          ),
        ),
      ),
    );
  }
}

class _GenerateHeader extends StatelessWidget {
  const _GenerateHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.15,
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'GENERATED PASSWORD',
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Expanded(
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.1,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade300),
                child: const Center(
                    child: Text(
                  'cjnKOPnji21-cjnKOPnji21',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomOptions extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool? isSlider;
  final double? length;
  const _CustomOptions({
    super.key,
    required this.child,
    this.length,
    this.isSlider,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.1,
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (isSlider != null)
                ?
                //Title
                Row(
                    children: [
                      (title != null)
                          ? Text(
                              title!.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            )
                          : const SizedBox(),
                      Text(
                        length!.toStringAsFixed(0).toString(),
                        style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ],
                  )
                : (title != null)
                    ? Text(
                        title!.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      )
                    : const SizedBox(),

            const SizedBox(
              height: 5.0,
            ),

            //Content
            Expanded(
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.1,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
