import 'package:flutter/material.dart';
import 'cuadro_turnos_escogida.dart';
import 'bkb.dart';
import 'tablasalarial.dart';
import '../widgets/fondo_degradado.dart';

class Documentacion extends StatelessWidget {
  const Documentacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Documentación",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
            height: 4,
            color: const Color.fromARGB(255, 233, 120, 28),
          ),
        ),
      ),
      body: FondoDegradado(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.article, color: Colors.orange),
                title: const Text(
                  "Cuadro de turnos escogida",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CuadroTurnosEscogida(),
                    ),
                  );
                },
              ),

              const Divider(),

              /// CÓDIGO BKB
              ListTile(
                leading: const Icon(Icons.article, color: Colors.orange),
                title: const Text(
                  "Código BKB Líneas",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Bkb()),
                  );
                },
              ),

              const Divider(),

              /// TABLA SALARIAL
              ListTile(
                leading: const Icon(Icons.article, color: Colors.orange),
                title: const Text(
                  "Tabla Salarial 2024-2025",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TablaSalarial(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
