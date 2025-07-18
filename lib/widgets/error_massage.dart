import 'package:flutter/material.dart';

class ErrorMassage extends StatelessWidget {
  const ErrorMassage({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(message, style: TextStyle(fontSize: 18, color: Colors.red));
  }
}
