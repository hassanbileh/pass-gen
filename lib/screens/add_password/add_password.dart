import 'package:flutter/material.dart';
import 'package:passgen/screens/screens.dart';
import 'package:passgen/widgets/widgets.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  late final TextEditingController _title, _password, _username, _notes;

  bool isHidden = false;
  @override
  void initState() {
    _title = TextEditingController();
    _username = TextEditingController();
    _password = TextEditingController();
    _notes = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.cancel_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 30.0,
              ),
            ),
            actions: [
              TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Save', style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),)
            ),
            ],
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            sliver: SliverToBoxAdapter(
              child: NewPasswordHeader(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            sliver: SliverToBoxAdapter(
              child: NewPasswordContent(
                title: _title,
                username: _username,
                password: _password,
                notes: _notes,
                isObscure: isHidden,
                iconButton: IconButton(
                  onPressed: () {
                    setState(() {
                      if (isHidden) {
                        isHidden = false;
                      } else {
                        isHidden = true;
                      }
                    });
                  },
                  icon: (!isHidden)
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.visibility_off),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
