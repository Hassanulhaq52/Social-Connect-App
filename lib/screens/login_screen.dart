import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/utils/contants.dart';
import 'package:task/utils/styles.dart';

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
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Lorem',
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const Text(
                        'IPSUM',
                        style: TextStyle(
                          letterSpacing: 8,
                          fontSize: 22,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: Styles.containerDecoration,
                    child: TextField(
                      decoration: Styles.emailField,
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
                    decoration: Styles.containerDecoration,
                    child: TextField(
                      obscureText: isVisible,
                      decoration: Styles.passwordField.copyWith(
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
                      fixedSize: const Size(double.infinity, 45.0),
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
