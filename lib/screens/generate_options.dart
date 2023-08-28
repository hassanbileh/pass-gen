import 'package:flutter/material.dart';

class CustomOptions extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool? isSlider;
  final double? length;
  const CustomOptions({
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
            (isSlider != null || isSlider == true)
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
              child: Card(
                elevation: 4.0,
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
