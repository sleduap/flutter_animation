import 'package:flutter/material.dart';
import 'package:flutter_animation/models/trip.dart';
import 'package:flutter_animation/shared/heart.dart';
// import 'package:flutter_animation/models/trip.dart';

class Details extends StatelessWidget {
  final Trip tile;
  const Details({Key? key, required this.tile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: tile.img,
              child: Image.asset(
                'images/${tile.img}',
                height: 360,
                fit: BoxFit.cover,
                alignment: Alignment.topLeft,
              ),
            ),
            ListTile(
                title: Text(tile.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[800])),
                subtitle: Text(
                    '${tile.nights} night stay for only \$${tile.price}',
                    style: const TextStyle(letterSpacing: 1)),
                trailing: Heart()),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                '''Dashain (aka Bada Dashain or Vijaya Dashami) is the largest and longest Hindu festival, celebrated mainly in Nepal. The Dashain festival lasts for fifteen days and begins on the day of Ghatasthapana  and finishes in the day of Kojagrat Purnima. Throughout the fifteen days, the Nepalese Hindus carry out many ceremonies and traditions as a community. The Dashain festival usually begins in October (Ashoj or Kartik in the Nepalese calendar) and is the longest public holiday in Nepal, All schools, offices and governmental offices are closed throughout the 15-day period of the festival!The festival celebrates the various victories of Hindu Gods over Demons, such as lord Ram defeating Ravan in a duel and Goddess Durga defeating the buffalo-demon Mahisasur, as well as many other demons. The festival as a whole is the celebration of the triumph of good over evil and the stories are told throughout the ceremony to provide moral examples to the community. 
      
      Some of the activities throughout Dashain are having fiesta-style parties, enjoying home-cooked meals and flying kites, to represent freedom. The festival usually ties in with the end of the Monsoon season, and some natives believe flying kites will communicate to God to end the rainfall season! People sacrifice a lot of animals in this festival, most of which are the goats, sheep, chicken or buffaloes. The trend of sacrificing animals however, is changing towards fruits and vegetables, as the animals slaughter is nowhere mentioned in the Hindu scriptures and the animal right activists strongly condemn it. Some of they key days during Dashain are:
      
      Day 1 (Ghatasthapana)
      Ghatasthapana is the first day of Bada Dashain.  A male family member will plant jamara (usually barley seeds) in moist sand. By the tenth day of the festival, the seeds will have grown to yellow grass, which is used with tika to bless people with prosperity and happiness.
      
      Day 7 (Fulpati)
      The special essence of festival gets from this day. On this auspicious day, a military parade is organized at Hanuman Dhoka. The Nepal Army, Nepal Police, Civil Service, Band Music and Panchebaja also join the fulpati parade. People clean their houses and decorate their houses with flowers. Today (19th of Oct) is Fulpati, and most of the festivities in our homes we will be taking places today! In our Dhading home, the kids will be flying kites, playing on the traditional swing and finishing the day off with a barbeque and a trip to the cinema! The children from our Birgunj home will be starting the day with Puja (prayers), followed by kite flying and a trip to the Parwanipur market, where there will be a huge fair! ''',
                style: TextStyle(
                  height: 1.4,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
