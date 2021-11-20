import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  const ScreenTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 36, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      duration: const Duration(seconds: 5),
      curve: Curves.easeIn,
      tween: Tween<double>(begin: 0.0, end: 1.0),
      builder: (BuildContext context, double _val, Widget? abc) {
        return Opacity(
          opacity: _val,
          child: Padding(
            padding: EdgeInsets.only(top: _val * 20),
            child: abc,
          ),
        );
      },
    );
  }
}
