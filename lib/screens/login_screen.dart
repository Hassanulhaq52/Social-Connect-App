import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/utils/contants.dart';

import '../bloc/login_bloc/login_bloc.dart';
import 'home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isPasswordCorrect == true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomeScreen();
              },
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'images/home.png',
                        height: 150,
                        width: 150,
                        // color: Colors.lightBlueAccent,
                      ),
                      SizedBox(height: 20),
                      const Text(
                        'Lorem',
                        style: TextStyle(
                          fontSize: 24, // Set your desired font size
                          fontWeight:
                              FontWeight.bold, // Set your desired font weight
                        ),
                      ),
                      const Text(
                        'IPSUM',
                        style: TextStyle(
                          fontSize: 18, // Set your desired font size
                          color: Colors.grey, // Set your desired text color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 1.0),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      onChanged: (email) {
                        context
                            .read<LoginBloc>()
                            .add(OnEmailChanged(email: email));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    child: TextField(
                      obscureText: isVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (isVisible == true) {
                                isVisible = false;
                              } else if (isVisible == false) {
                                isVisible = true;
                              }
                            });
                          },
                          icon: isVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                        hintText: 'Password',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 1.0),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      onChanged: (password) {
                        context
                            .read<LoginBloc>()
                            .add(OnPasswordChanged(password: password));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(OnLoginPressed());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(int.parse(Constants.primaryColor)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fixedSize: const Size(double.infinity,
                          45.0), // Set the desired width and height
                    ),
                    child: const Text('LOGIN',
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
