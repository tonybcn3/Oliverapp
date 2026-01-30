import 'package:flutter/material.dart';
import '../widgets/fondo_degradado.dart';
import 'plantilla_mes.dart'; // Importamos la plantilla de días

class SeleccionMesNomina extends StatelessWidget {
  const SeleccionMesNomina({super.key});

  static const List<String> meses = [
    "ENERO",
    "FEBRERO",
    "MARZO",
    "ABRIL",
    "MAYO",
    "JUNIO",
    "JULIO",
    "AGOSTO",
    "SEPTIEMBRE",
    "OCTUBRE",
    "NOVIEMBRE",
    "DICIEMBRE",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Selecciona el mes",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4),
          child: ColoredLine(),
        ),
      ),

      body: FondoDegradado(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: meses.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 botones por fila
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(8),
                ),
                onPressed: () {
                  int dias;
                  switch (meses[index]) {
                    case "ENERO":
                    case "MARZO":
                    case "MAYO":
                    case "JULIO":
                    case "AGOSTO":
                    case "OCTUBRE":
                    case "DICIEMBRE":
                      dias = 31;
                      break;
                    case "ABRIL":
                    case "JUNIO":
                    case "SEPTIEMBRE":
                    case "NOVIEMBRE":
                      dias = 30;
                      break;
                    case "FEBRERO":
                      dias = 28;
                      break;
                    default:
                      dias = 30;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          PlantillaMes(mes: meses[index], diasMes: dias),
                    ),
                  );
                },
                child: Text(
                  meses[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/* Línea naranja del AppBar */
class ColoredLine extends StatelessWidget {
  const ColoredLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 4, color: const Color.fromARGB(255, 233, 120, 28));
  }
}
