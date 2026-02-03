import 'package:flutter/material.dart';
import 'imagen_grande.dart';
import 'en_que_grupo_estoy_v.dart';
import '../widgets/fondo_degradado.dart';

class Vacaciones extends StatelessWidget {
  const Vacaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Vacaciones",
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
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ---------- IMAGEN CON MARCO Y SOMBRA ----------
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ImagenGrande()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                      0.85,
                    ), // marco semi-transparente
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 12,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    "assets/imagenes/cuadro_vacaciones/cuadro_vacaciones.jpg",
                    width: 320,
                    height: 320,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ---------- BOTÓN ----------
              SizedBox(
                width: 260,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 233, 120, 28),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const EnQueGrupoEstoy(),
                      ),
                    );
                  },
                  child: const Text(
                    "¿En qué grupo estoy?",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
