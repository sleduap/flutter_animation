import 'package:flutter/material.dart';
import 'package:flutter_animation/models/trip.dart';
import 'package:flutter_animation/screen/details.dart';

class ListTitle extends StatefulWidget {
  const ListTitle({Key? key}) : super(key: key);

  @override
  _ListTitleState createState() => _ListTitleState();
}

class _ListTitleState extends State<ListTitle> {
  final GlobalKey<AnimatedListState> _listkey = GlobalKey<AnimatedListState>();

  final List<Widget> _listTile = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _listTitle();
    });
  }

  void _listTitle() {
    List<Trip> _data = [
      Trip(
          title: 'Beach Paradise', price: '350', nights: '3', img: 'beach.png'),
      Trip(title: 'City Break', price: '400', nights: '5', img: 'city.png'),
      Trip(title: 'Ski Adventure', price: '750', nights: '2', img: 'ski.png'),
      Trip(title: 'Space Blast', price: '600', nights: '4', img: 'space.png'),
    ];
    Future ft = Future(() {});
    _data.forEach((element) {
      ft = ft.then((value) {
        return Future.delayed(const Duration(milliseconds: 200), () {
          _listTile.add(_tile(element));
          _listkey.currentState!.insertItem(_listTile.length - 1);
        });
      });
    });
  }

  Widget _tile(Trip tile) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Details(tile: tile)));
      },
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${tile.nights} nights',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[300])),
          Text(tile.title,
              style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
          tag: tile.img,
          child: Image.asset(
            'images/${tile.img}',
            height: 50,
          ),
        ),
      ),
      trailing: Text('\$${tile.price}'),
    );
  }

  Tween<Offset> _offsetValue = Tween(begin: Offset(2, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _listkey,
        initialItemCount: _listTile.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            child: _listTile[index],
            position: animation.drive(_offsetValue),
          );
        });
  }
}
