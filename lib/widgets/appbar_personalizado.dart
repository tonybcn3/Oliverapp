import 'package:flutter/material.dart';

class AppBarPersonalizado extends StatelessWidget
    implements PreferredSizeWidget {
  final String titulo;

  const AppBarPersonalizado({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titulo,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: Container(
          height: 4,
          color: const Color.fromARGB(255, 233, 120, 28),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 4);
}
