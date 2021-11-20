import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double?> _sizeAnimation;
  late Animation<double> _curve;
  bool isfav = false;
  // final Color abc = state? Colors.red : Colors.grey;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _colorAnimation =
        ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_curve);
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: 30, end: 50), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 30), weight: 50)
    ]).animate(_curve);

    _controller.addListener(() {});
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isfav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isfav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          return IconButton(
            icon: Icon(
              Icons.favorite,
              color: _colorAnimation.value,
              size: _sizeAnimation.value,
            ),
            onPressed: () {
              isfav ? _controller.reverse() : _controller.forward();
            },
          );
        });
  }
}
