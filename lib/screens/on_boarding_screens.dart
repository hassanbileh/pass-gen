import 'package:flutter/material.dart';
import 'package:passgen/constants/assets/assets_constants.dart';
import 'package:passgen/widgets/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: height * 0.7,
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
                        _OnBoardingPage(
                          image: Assets.logo,
                          height: height * 0.25,
                          width: width * 0.95,
                          title: Assets.welcomeTitle,
                          text: Assets.welcomeText,
                        ),
                        _OnBoardingPage(
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
            const SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}


class _OnBoardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  final double height;
  final double width;
  const _OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.text,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //logo
        Container(
          height: height,
          width: width,
          margin:  EdgeInsets.only(top: height * 0.1, bottom: 5.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
    
        const SizedBox(
          height: 20.0,
        ),
    
        //welcome message
        Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  height: 150.0,
                  width: 300.0,
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    
        //next button
      ],
    );
  }
}
