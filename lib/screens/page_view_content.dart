import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  final double height;
  final double width;
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.text,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
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
      ),
    );
  }
}
