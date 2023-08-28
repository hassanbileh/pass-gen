import 'package:flutter/material.dart';
import 'package:passgen/constants/assets/assets_constants.dart';
import 'package:flutter/services.dart';
import 'package:passgen/data/data.dart';
import 'package:passgen/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _search;
  late ScrollController _scrollController;
  double offset = 0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        offset = _scrollController.offset;
      });
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
      // appBar: PreferredSize(
      //   preferredSize: Size(MediaQuery.sizeOf(context).width * 0.95,
      //       MediaQuery.sizeOf(context).height * 0.15),
      //   child: BlocBuilder<AppBarCubit, double>(
      //     builder: (context, scrollOffset) {
      //       return _CustomAppBar(
      //         offset: scrollOffset,
      //         search: _search,
      //       );
      //     },
      //   ),
      // ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            stretch: true,
            expandedHeight: 150,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: PreferredSize(
                  preferredSize: Size(MediaQuery.sizeOf(context).width * 0.95,
                      MediaQuery.sizeOf(context).height * 0.15),
                  child: _CustomAppBar(
                    search: _search,
                  )),
            ),
          ),
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            sliver: SliverLayoutBuilder(
              builder: (context, constraints) {
                return PasswordList(
                  passwords: perUser,
                  onTap: () {},
                );
              },
            ),
          ),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () =>
            Navigator.of(context).pushNamed(Assets.newPasswordRoute),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final TextEditingController search;
  const _CustomAppBar({super.key, required this.search});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamed(Assets.newPasswordRoute),
                    child: const Text(
                      'Add password',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Center(
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.07,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: search,
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
            ),
          ],
        ),
      ),
    );
  }
}
