import 'package:flutter/material.dart';
import '../widgets/fondo_degradado.dart';
import '../widgets/colored_line.dart';
import 'resumen_nomina.dart';

class DatosAdicionales extends StatefulWidget {
  final Map<int, String> diasSeleccionados;
  final String mes;

  const DatosAdicionales({
    super.key,
    required this.diasSeleccionados,
    required this.mes,
  });

  @override
  State<DatosAdicionales> createState() => _DatosAdicionalesState();
}

class _DatosAdicionalesState extends State<DatosAdicionales> {
  double antiguedad = 0;
  final TextEditingController irpfController = TextEditingController();
  int festivosTrabajados = 0;

  // Nuevos datos
  bool tiene60OMas = false;
  bool anadirBolsaVacaciones = false;

  @override
  void dispose() {
    irpfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Datos adicionales",
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
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Antigüedad
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Seleccione la antigüedad (años):",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${antiguedad.toInt()} años",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
                ),

                Slider(
                  value: antiguedad,
                  min: 0,
                  max: 35,
                  divisions: 35,
                  activeColor: const Color.fromARGB(255, 233, 120, 28),
                  inactiveColor: const Color.fromARGB(80, 233, 120, 28),
                  onChanged: (value) {
                    setState(() {
                      antiguedad = value;
                    });
                  },
                ),

                const SizedBox(height: 30),

                // IRPF
                const Text(
                  "Introduzca el IRPF (%):",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),

                TextField(
                  controller: irpfController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Ej: 20,56",
                  ),
                ),

                const SizedBox(height: 30),

                // Festivos oficiales trabajados
                const Text(
                  "Festivos oficiales trabajados:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),

                DropdownButton<int>(
                  value: festivosTrabajados,
                  isExpanded: true,
                  items: List.generate(
                    5,
                    (index) => DropdownMenuItem(
                      value: index,
                      child: Text(index.toString()),
                    ),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        festivosTrabajados = value;
                      });
                    }
                  },
                ),

                const SizedBox(height: 25),

                // ¿Tienes 60 años o más?
                const Text(
                  "Tienes 60 años o más",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),

                DropdownButton<bool>(
                  value: tiene60OMas,
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(value: false, child: Text("NO")),
                    DropdownMenuItem(value: true, child: Text("SÍ")),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        tiene60OMas = value;
                      });
                    }
                  },
                ),

                const SizedBox(height: 25),

                // Añadir bolsa de vacaciones
                const Text(
                  "Añadir bolsa de vacaciones",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),

                DropdownButton<bool>(
                  value: anadirBolsaVacaciones,
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(value: false, child: Text("NO")),
                    DropdownMenuItem(value: true, child: Text("SÍ")),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        anadirBolsaVacaciones = value;
                      });
                    }
                  },
                ),

                const SizedBox(height: 30),

                // Botón continuar
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      final irpfText = irpfController.text.replaceAll(",", ".");
                      final irpf = double.tryParse(irpfText) ?? 0.0;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ResumenNomina(
                            diasSeleccionados: widget.diasSeleccionados,
                            antiguedad: antiguedad,
                            irpf: irpf,
                            festivosTrabajados: festivosTrabajados,
                            tiene60OMas: tiene60OMas,
                            anadirBolsaVacaciones: anadirBolsaVacaciones,
                            mes: widget.mes,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "CONTINUAR",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
