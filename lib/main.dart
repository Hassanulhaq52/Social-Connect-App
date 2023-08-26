import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/login_bloc/login_bloc.dart';
import 'package:task/screens/login_screen.dart';
import 'package:task/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child:  const MaterialApp(
        title: 'Task',
        home: SplashScreen(),
      ),
    );
  }
}
