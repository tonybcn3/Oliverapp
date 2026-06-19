import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/fondo_degradado.dart';
import 'datos_adicionales.dart';
import '../data/turnos_data.dart';

class PlantillaMes extends StatefulWidget {
  final String mes;
  final int diasMes;

  final Map<int, String>? datosGuardados;

  const PlantillaMes({
    super.key,
    required this.mes,
    required this.diasMes,
    this.datosGuardados,
  });

  @override
  State<PlantillaMes> createState() => _PlantillaMesState();
}

class _PlantillaMesState extends State<PlantillaMes> {
  Map<int, String> diasSeleccionados = {};

  // 🔹 DÍAS MARCADOS PARA MULTISELECCIÓN
  Set<int> diasMarcados = {};

  late final List<Turno> turnosLaborablesList;
  late final List<Turno> turnosSabadosList;
  late final List<Turno> turnosDomingosList;

  @override
  void initState() {
    super.initState();

    if (widget.datosGuardados != null) {
      diasSeleccionados = Map.from(widget.datosGuardados!);
    }

    turnosLaborablesList = turnosLaborables.values.toList()
      ..sort((a, b) => a.codigo.compareTo(b.codigo));

    turnosSabadosList = turnosSabados.values.toList()
      ..sort((a, b) => a.codigo.compareTo(b.codigo));

    turnosDomingosList = turnosDomingos.values.toList()
      ..sort((a, b) => a.codigo.compareTo(b.codigo));
  }

  // =============================
  // 🔹 AUTOGUARDADO
  // =============================
  Future<void> _guardarAutomaticamente() async {
    final prefs = await SharedPreferences.getInstance();

    final diasConvertidos = diasSeleccionados.map(
      (key, value) => MapEntry(key.toString(), value),
    );

    final datos = {'diasSeleccionados': diasConvertidos};

    await prefs.setString('nomina_${widget.mes}', jsonEncode(datos));
  }

  // =============================
  // 🔹 ASIGNAR TURNO
  // =============================
  Future<void> _asignarTurno(int dia) async {
    String? resultado = await _seleccionarTipoTurno();

    if (resultado == null) return;

    String valorFinal = resultado;

    if (resultado != "FIESTA") {
      List<Turno> turnos = [];

      if (resultado == "LABORABLES") {
        turnos = turnosLaborablesList;
      } else if (resultado == "SABADOS") {
        turnos = turnosSabadosList;
      } else if (resultado == "DOMINGOS") {
        turnos = turnosDomingosList;
      }

      String? turnoSeleccionado = await _seleccionarTurno(turnos);

      if (turnoSeleccionado == null) return;

      valorFinal = turnoSeleccionado;
    }

    setState(() {
      // 🔹 SI HAY MULTISELECCIÓN
      if (diasMarcados.isNotEmpty) {
        for (final d in diasMarcados) {
          diasSeleccionados[d] = valorFinal;
        }

        diasMarcados.clear();
      }
      // 🔹 SI ES SOLO UN DÍA
      else {
        diasSeleccionados[dia] = valorFinal;
      }
    });

    _guardarAutomaticamente();
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
            // =============================
            // 🔹 BOTÓN CONTINUAR
            // =============================
            if (index == widget.diasMes) {
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
              );
            }

            final dia = index + 1;
            final valorDia = diasSeleccionados[dia] ?? "";

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: GestureDetector(
                onLongPress: () {
                  setState(() {
                    if (diasMarcados.contains(dia)) {
                      diasMarcados.remove(dia);
                    } else {
                      diasMarcados.add(dia);
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: diasMarcados.contains(dia)
                        ? Colors.orange.withOpacity(0.25)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
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
                            backgroundColor: diasMarcados.contains(dia)
                                ? Colors.deepOrange
                                : Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),

                          // 🔹 NUEVO
                          onPressed: () => _asignarTurno(dia),

                          child: Text(
                            valorDia.isEmpty
                                ? (diasMarcados.isNotEmpty
                                      ? "Aplicar selección"
                                      : "Selecciona turno")
                                : obtenerTurno(valorDia)?.codigoVisible ??
                                      valorDia,
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// =============================
  /// 🔹 DIÁLOGO TIPO TURNO
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

  /// =============================
  /// 🔹 DIÁLOGO TURNOS
  /// =============================
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
                title: Text(turnos[index].codigoVisible),
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
/// 🔹 LÍNEA DECORATIVA
/// =============================
class ColoredLine extends StatelessWidget {
  const ColoredLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 4, color: const Color.fromARGB(255, 233, 120, 28));
  }
}
