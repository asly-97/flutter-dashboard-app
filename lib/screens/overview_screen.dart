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
      body: const SafeArea(
        child: Text('Hello!'),
      ),
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
