import 'package:flutter/material.dart';

import 'package:task/screens/posts_screen.dart';
import 'package:task/screens/profile_screen.dart';

import '../utils/contants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.table_rows),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16.0),
            ),
            const Icon(Icons.search),
          ],
          backgroundColor: Color(int.parse(Constants.primaryColor)),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelPadding: EdgeInsets.all(9),
            tabs: [
              Text("ALL POSTS"),
              Text("PROFILE"),
            ],
          ),
          title: const Text('Lorem Ipsum'),
        ),
        body: const TabBarView(
          children: [
            PostScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
