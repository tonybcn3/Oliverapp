import 'package:flutter/material.dart';
import '../widgets/appbar_personalizado.dart';
import '../widgets/fondo_degradado.dart';

class Informacion extends StatelessWidget {
  const Informacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPersonalizado(titulo: "Información"),
      body: FondoDegradado(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 🟧 LOGO / NOMBRE APP
              Column(
                children: const [
                  Icon(
                    Icons.info_outline,
                    size: 80,
                    color: Color.fromARGB(255, 233, 120, 28),
                  ),
                  SizedBox(height: 10),

                  /// 🔸 OLIVERapp con el MISMO diseño que main.dart
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "OLIVER",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "app",
                          style: TextStyle(
                            fontSize: 26,
                            fontStyle: FontStyle.italic,
                            color: Color.fromARGB(255, 233, 120, 28),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 4),
                  Text("Versión 2.0", style: TextStyle(color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 30),

              _infoCard(
                icon: Icons.description,
                title: "Descripción",
                content:
                    "Aplicación diseñada para facilitar la información sobre turnos, "
                    "vacaciones, fiestas, documentación y nóminas de manera sencilla.",
              ),

              _infoCard(
                icon: Icons.person,
                title: "Creación y diseño",
                content: "Aplicación desarrollada y diseñada por Toni Aguayo.",
              ),

              _infoCard(
                icon: Icons.folder,
                title: "Documentación",
                content:
                    "La información y documentación mostrada en la aplicación "
                    "ha sido recopilada y aportada por:\n\n"
                    "• Comité C.C.O.O UTE Sant Boi\n"
                    "• Juan Manuel Cutillas\n"
                    "• Toni Aguayo",
              ),

              _infoCard(
                icon: Icons.code,
                title: "Tecnología",
                content:
                    "Aplicación desarrollada con Flutter para dispositivos iOS y Android.",
              ),

              _infoCard(
                icon: Icons.copyright,
                title: "Derechos",
                content:
                    "© 2026 Toni Aguayo. Uso exclusivo para oliveros "
                    "y no para usos comerciales.",
              ),

              const SizedBox(height: 30),

              const Center(
                child: Text(
                  "Gracias por usar la aplicación 😊",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _infoCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 30,
              color: const Color.fromARGB(255, 233, 120, 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(content, style: const TextStyle(fontSize: 15)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
