import 'package:flutter/material.dart';
import 'package:flutter_animation/shared/list_tile.dart';
import 'package:flutter_animation/shared/screen_title.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topLeft)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 120, child: ScreenTitle(title: 'Sleduap Tour')),
            Flexible(child: ListTitle())
          ],
        ),
      ),
    );
  }
}
