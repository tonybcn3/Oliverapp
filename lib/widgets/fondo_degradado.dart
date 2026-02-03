import 'package:flutter/material.dart';

class FondoDegradado extends StatelessWidget {
  final Widget child;

  const FondoDegradado({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Color.fromARGB(40, 233, 120, 28), // naranja muy suave
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
