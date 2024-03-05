import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF63b5af), Color(0xFF438883)])),
        child: const Text(
          'Finanças',
          style: TextStyle(
              fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
