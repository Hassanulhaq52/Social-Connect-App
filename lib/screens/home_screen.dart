import 'package:flutter/material.dart';
import 'package:task/bloc/login_bloc/login_bloc.dart';
import 'package:task/screens/posts_screen.dart';
import 'package:task/screens/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/contants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.table_rows),
          actions: [
            Container(  // Add an empty container with margin
              margin: EdgeInsets.only(right: 16.0),
            ),
            Icon(Icons.search),
          ],
          backgroundColor: Color(int.parse(Constants.primaryColor)), // Set primary color as background color
          bottom: const TabBar(
            indicatorColor: Colors.white, // Set active tab indicator color
            labelPadding: EdgeInsets.all(9),
            tabs: [
              Text("ALL POSTS"),
              Text("PROFILE"),
            ],
          ),
          title: Text('Lorem Ipsum'),
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
