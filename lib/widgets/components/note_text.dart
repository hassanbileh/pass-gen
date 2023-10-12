import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  const Note({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 100,
      child: const Row(
        children: [
          Icon(
            Icons.info,
          ),
          SizedBox(width: 5,),
          Expanded(
            child: Text(
              "We recommand you to choose a 'LENGTH' minimum of 10 and to switch 'ON' all the options.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
