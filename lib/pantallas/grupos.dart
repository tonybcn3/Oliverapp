import 'package:flutter/material.dart';
import '../widgets/fondo_degradado.dart';

class CalendarioPorGrupos extends StatelessWidget {
  const CalendarioPorGrupos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagenes = [
      "assets/imagenes/calendario_fiestas/grupo01_2026.jpg",
      "assets/imagenes/calendario_fiestas/grupo02_2026.jpg",
      "assets/imagenes/calendario_fiestas/grupo03_2026.jpg",
      "assets/imagenes/calendario_fiestas/grupo04_2026.jpg",
      "assets/imagenes/calendario_fiestas/grupo05_2026.jpg",
      "assets/imagenes/calendario_fiestas/grupo06_2026.jpg",
      "assets/imagenes/calendario_fiestas/grupo07_2026.jpg",
      "assets/imagenes/calendario_fiestas/grupo08_2026.jpg",
      "assets/imagenes/calendario_fiestas/grupo09_2026.jpg",
      "assets/imagenes/calendario_fiestas/grupo10_2026.jpg",
      "assets/imagenes/calendario_fiestas/grupo11_2026.jpg",
      "assets/imagenes/calendario_fiestas/grupo12_2026.jpg",
      "assets/imagenes/calendario_fiestas/grupo13_2026.jpg",
      "assets/imagenes/calendario_fiestas/grupo14_2026.jpg",
      "assets/imagenes/calendario_fiestas/grupo15_2026.jpg",
      "assets/imagenes/calendario_fiestas/grupo16_2026.jpg",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calendario por Grupos",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
            height: 4,
            color: const Color.fromARGB(255, 233, 120, 28), // línea naranja
          ),
        ),
      ),
      body: FondoDegradado(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: imagenes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 233, 120, 28),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                ),
                onPressed: () {
                  // Abrir imagen en fondo blanco
                  showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      child: InteractiveViewer(
                        child: Image.asset(
                          imagenes[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
                child: Text(
                  "Grupo ${index + 1}",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
