import 'package:flutter/material.dart';
import 'cuadro_turnos_escogida.dart';
import 'bkb.dart';
import 'convenio.dart';
import 'tablas_salariales_26_29.dart';
import 'tablas_salariales_22_25.dart';
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

              /// TABLAS SALARIALES 2022-2025
              ListTile(
                leading: const Icon(Icons.article, color: Colors.orange),
                title: const Text(
                  "Tablas Salariales 2022-2025",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TablasSalariales22_25(),
                    ),
                  );
                },
              ),

              const Divider(),

              /// CONVENIO 2026-2029
              ListTile(
                leading: const Icon(Icons.article, color: Colors.orange),
                title: const Text(
                  "Convenio 2026-2029",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Convenio()),
                  );
                },
              ),

              const Divider(),

              /// TABLAS SALARIALES 2026-2029
              ListTile(
                leading: const Icon(Icons.article, color: Colors.orange),
                title: const Text(
                  "Tablas Salariales 2026-2029",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TablasSalariales26_29(),
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
