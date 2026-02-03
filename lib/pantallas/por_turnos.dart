import 'package:flutter/material.dart';
import '../widgets/fondo_degradado.dart';

class CalendarioPorTurnos extends StatelessWidget {
  const CalendarioPorTurnos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagenes = [
      "assets/imagenes/calendario_fiestas_turnos/por_turnos_hoja_1.jpg",
      "assets/imagenes/calendario_fiestas_turnos/por_turnos_hoja_2.jpg",
      "assets/imagenes/calendario_fiestas_turnos/por_turnos_hoja_3.jpg",
    ];

    final List<String> titulos = ["Hoja 1", "Hoja 2", "Hoja 3 + Festivos"];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calendario por Turnos",
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            // ALTURA DISPONIBLE EN PANTALLA
            double totalHeight = constraints.maxHeight;
            // Cada bloque (imagen + título + separación)
            double blockHeight = totalHeight / 3 - 20;
            // Miniatura dentro de cada bloque
            double imageHeight = blockHeight * 0.75;
            double imageWidth = imageHeight * 0.8; // relación visual agradable

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) {
                  return Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
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
                        child: Container(
                          width: imageWidth,
                          height: imageHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey[300],
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(2, 2),
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage(imagenes[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        titulos[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
