import 'package:flutter/material.dart';
import 'package:passgen/widgets/widgets.dart';
import 'package:passgen/data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _search;

  @override
  void initState() {
    _search = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              CustomTextField(
                padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 15.0),
                controller: _search,
                hintText: 'Search for passwords',
                labelText: null,
                isPassword: false,
              ),

              const SizedBox(height: 20.0,),

              PasswordList(passwords: perUser, onTap: (){},),

            ],
          ),
        ),
      ),
    );
  }
}
