import 'package:flutter/material.dart';
import 'package:passgen/cubits/appBarCubit/app_bar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passgen/screens/screens.dart';
import 'package:passgen/widgets/widgets.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  late final TextEditingController _title, _password, _username, _notes;
  late ScrollController _controller;
  bool isHidden = false;
  @override
  void initState() {
    _controller = ScrollController()
      ..addListener(() {
        context.read<AppBarCubit>().setOffset(_controller.offset);
      });
    _title = TextEditingController();
    _username = TextEditingController();
    _password = TextEditingController();
    _notes = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBarCubit>(
      create: (context) => AppBarCubit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 80.0),
          child: BlocBuilder<AppBarCubit, double>(
              builder: (context, scrollOffset) {
            return SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 24.0),
                color: Colors.black
                    .withOpacity((scrollOffset / 100).clamp(0, 1).toDouble()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.red[900],
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        body: CustomScrollView(
          controller: _controller,
          slivers: [
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
      ),
    );
  }
}
