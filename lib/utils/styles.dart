import 'package:flutter/material.dart';

class Styles {
  static InputDecoration emailField = InputDecoration(
    hintText: 'Email',
    contentPadding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300, width: 2.0),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
  );

  static InputDecoration passwordField = InputDecoration(
    hintText: 'Password',
    contentPadding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300, width: 2.0),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
  );

  static BoxDecoration containerDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.grey.shade300,
  );
}
