import 'package:dashboard/widgets/charts/bar_chart_card.dart';
import 'package:dashboard/widgets/card_tile.dart';
import 'package:dashboard/widgets/closable_text_card.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  static final String ROUTE = 'SPLASH_SCREEN_ROUTE';

  const OverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Overview'),
        actions: const [
          Icon(Icons.notifications, color: Colors.grey),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage(
                'assets/profile.jpg',
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardTile(
                      icon: Icons.emoji_objects_sharp,
                      iconColor: Colors.blue,
                      title: '150',
                      subTitle: 'My observations'),
                  CardTile(
                      icon: Icons.pause,
                      iconColor: Colors.blue,
                      title: '4',
                      subTitle: 'Pending'),
                  CardTile(
                      icon: Icons.timelapse,
                      iconColor: Colors.orange,
                      title: '1',
                      subTitle: 'Progress'),
                  CardTile(
                      icon: Icons.check,
                      iconColor: Colors.green,
                      title: '2',
                      subTitle: 'Resolved'),
                  CardTile(
                      icon: Icons.lock,
                      iconColor: Colors.grey,
                      title: '1',
                      subTitle: 'Cosed'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ClosableTextCard('Daily'),
                  ClosableTextCard('Safety'),
                  ClosableTextCard('Excellent'),
                  ClosableTextCard('Work clothes, E.P.I'),
                  ClosableTextCard('Bad condition'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BarChartCard(),
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
