import 'package:flutter/material.dart';
import '../widgets/fondo_degradado.dart';
import '../widgets/colored_line.dart';
import 'nomina_detalle.dart';

class ResumenNomina extends StatelessWidget {
  final Map<int, String> diasSeleccionados;
  final double antiguedad;
  final double irpf;
  final int festivosTrabajados; // <-- Nuevo dato

  const ResumenNomina({
    super.key,
    required this.diasSeleccionados,
    this.antiguedad = 0,
    this.irpf = 0,
    this.festivosTrabajados = 0, // valor por defecto
  });

  @override
  Widget build(BuildContext context) {
    final dias = diasSeleccionados.keys.toList()..sort();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Resumen de la nómina",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4),
          child: ColoredLine(),
        ),
      ),
      body: FondoDegradado(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Mostrar días + turnos
                  ...dias.map((dia) {
                    final turno = diasSeleccionados[dia] ?? "";

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                            child: Text(
                              "$dia",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                turno,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),

                  const SizedBox(height: 20),

                  // Antigüedad
                  Text(
                    "Antigüedad: ${antiguedad.toStringAsFixed(0)} años",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // IRPF
                  Text(
                    "IRPF: ${irpf.toStringAsFixed(2)}%",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Festivos oficiales trabajados
                  Text(
                    "Festivos oficiales trabajados: $festivosTrabajados",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // 🔽 BOTÓN CALCULAR
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NominaDetalle(
                          diasSeleccionados: diasSeleccionados,
                          antiguedad: antiguedad,
                          irpf: irpf,
                          festivosTrabajados:
                              festivosTrabajados, // <-- Pasamos el dato
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "CALCULAR",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
