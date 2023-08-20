import 'package:flutter/material.dart';
import 'package:passgen/constants/assets/assets_constants.dart';
import 'package:passgen/widgets/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'screens.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.85,
            child: Stack(
              children: [
                PageView(
                  onPageChanged: (value) {
                    setState(() {
                      onLastPage = (value == 1);
                    });
                  },
                  controller: _controller,
                  children: [
                    OnBoardingPage(
                      image: Assets.logo,
                      height: height * 0.25,
                      width: width * 0.95,
                      title: Assets.welcomeTitle,
                      text: Assets.welcomeText,
                    ),
                    OnBoardingPage(
                      image: Assets.dataProtection,
                      height: height * 0.3,
                      width: width * 0.70,
                      title: Assets.welcomeTitle2,
                      text: Assets.welcomeText2,
                    ),
                  ],
                ),
                Container(
                  alignment: const Alignment(0, 0.85),
                  child: SmoothPageIndicator(
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.red,
                    ),
                    controller: _controller,
                    count: 2,
                  ),
                ),
              ],
            ),
          ),
          onLastPage
              ? CustomButton(
                  content: Assets.welcomeButton2,
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(Assets.registerRoute, (route) => false);
                  })
              : CustomButton(
                  content: Assets.welcomeButton1,
                  onTap: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                    );
                  }),
        ],
      ),
    );
  }
}
