import 'package:flutter/material.dart';
import '../widgets/fondo_degradado.dart';
import 'datos_adicionales.dart';
import '../data/turnos_data.dart'; // <-- Importamos los turnos en formato Map

class PlantillaMes extends StatefulWidget {
  final String mes;
  final int diasMes;

  const PlantillaMes({super.key, required this.mes, required this.diasMes});

  @override
  State<PlantillaMes> createState() => _PlantillaMesState();
}

class _PlantillaMesState extends State<PlantillaMes> {
  Map<int, String> diasSeleccionados = {};

  /// 🔹 Convertimos los Map a List SOLO para la UI
  late final List<Turno> turnosLaborablesList;
  late final List<Turno> turnosSabadosList;
  late final List<Turno> turnosDomingosList;

  @override
  void initState() {
    super.initState();

    turnosLaborablesList = turnosLaborables.values.toList()
      ..sort((a, b) => a.codigo.compareTo(b.codigo));

    turnosSabadosList = turnosSabados.values.toList()
      ..sort((a, b) => a.codigo.compareTo(b.codigo));

    turnosDomingosList = turnosDomingos.values.toList()
      ..sort((a, b) => a.codigo.compareTo(b.codigo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nómina: ${widget.mes}",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4),
          child: ColoredLine(),
        ),
      ),
      body: FondoDegradado(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: widget.diasMes + 1,
          itemBuilder: (context, index) {
            if (index == widget.diasMes) {
              // 🔹 BOTÓN CONTINUAR
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DatosAdicionales(
                            diasSeleccionados: diasSeleccionados,
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
              );
            }

            final dia = index + 1;
            final valorDia = diasSeleccionados[dia] ?? "";

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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () async {
                        String? resultado = await _seleccionarTipoTurno();
                        if (resultado == null) return;

                        if (resultado == "FIESTA") {
                          setState(() {
                            diasSeleccionados[dia] = "FIESTA";
                          });
                        } else {
                          List<Turno> turnos = [];

                          if (resultado == "LABORABLES") {
                            turnos = turnosLaborablesList;
                          } else if (resultado == "SABADOS") {
                            turnos = turnosSabadosList;
                          } else if (resultado == "DOMINGOS") {
                            turnos = turnosDomingosList;
                          }

                          String? turnoSeleccionado = await _seleccionarTurno(
                            turnos,
                          );

                          if (turnoSeleccionado != null) {
                            setState(() {
                              diasSeleccionados[dia] = turnoSeleccionado;
                            });
                          }
                        }
                      },
                      child: Text(
                        valorDia.isEmpty ? "Selecciona turno" : valorDia,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// =============================
  /// DIÁLOGOS
  /// =============================
  Future<String?> _seleccionarTipoTurno() {
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Selecciona tipo de turno"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("LABORABLES"),
              onTap: () => Navigator.pop(context, "LABORABLES"),
            ),
            ListTile(
              title: const Text("SÁBADOS"),
              onTap: () => Navigator.pop(context, "SABADOS"),
            ),
            ListTile(
              title: const Text("DOMINGOS Y FESTIVOS"),
              onTap: () => Navigator.pop(context, "DOMINGOS"),
            ),
            ListTile(
              title: const Text("FIESTA"),
              onTap: () => Navigator.pop(context, "FIESTA"),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _seleccionarTurno(List<Turno> turnos) {
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Selecciona turno"),
        content: SizedBox(
          width: double.maxFinite,
          height: 400,
          child: ListView.builder(
            itemCount: turnos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(turnos[index].codigo),
                onTap: () => Navigator.pop(context, turnos[index].codigo),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// =============================
/// LÍNEA DECORATIVA
/// =============================
class ColoredLine extends StatelessWidget {
  const ColoredLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 4, color: const Color.fromARGB(255, 233, 120, 28));
  }
}
