import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.text});
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text("$text", style: TextStyle()),
    );
    // return Container(
    //   width: double.infinity,
    //   height: 60,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(28),
    //     color: Colors.white,
    //   ),
    //   child: Center(
    //     child: Text('Sign in', style: TextStyle(color: Colors.black)),
    //   ),
    // );
  }
}
