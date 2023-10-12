import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Color(0xFF320A67)])),
        child: child);
  }
}
