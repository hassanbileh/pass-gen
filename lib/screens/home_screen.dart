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
              const SizedBox(height: 10.0,),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.07,
                width: MediaQuery.sizeOf(context).width * 0.85,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child:  Icon(Icons.search, size: 30, color: Colors.grey,),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _search,
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade100),
                          ),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'search for passwords',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(
                height: 15.0,
              ),
              PasswordList(
                passwords: perUser,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
