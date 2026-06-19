import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/fondo_degradado.dart';
import 'plantilla_mes.dart';
import 'historial_nominas.dart';

class SeleccionMesNomina extends StatefulWidget {
  const SeleccionMesNomina({super.key});

  @override
  State<SeleccionMesNomina> createState() => _SeleccionMesNominaState();
}

class _SeleccionMesNominaState extends State<SeleccionMesNomina> {
  static const List<Map<String, String>> meses = [
    {"nombre": "ENERO", "abreviado": "ENE"},
    {"nombre": "FEBRERO", "abreviado": "FEB"},
    {"nombre": "MARZO", "abreviado": "MAR"},
    {"nombre": "ABRIL", "abreviado": "ABR"},
    {"nombre": "MAYO", "abreviado": "MAY"},
    {"nombre": "JUNIO", "abreviado": "JUN"},
    {"nombre": "JULIO", "abreviado": "JUL"},
    {"nombre": "AGOSTO", "abreviado": "AGO"},
    {"nombre": "SEPTIEMBRE", "abreviado": "SEP"},
    {"nombre": "OCTUBRE", "abreviado": "OCT"},
    {"nombre": "NOVIEMBRE", "abreviado": "NOV"},
    {"nombre": "DICIEMBRE", "abreviado": "DIC"},
  ];

  // 🔹 Meses que tienen datos guardados
  Set<String> mesesConDatos = {};

  @override
  void initState() {
    super.initState();
    _cargarMesesGuardados();
  }

  // =============================
  // 🔹 CARGAR MESES GUARDADOS
  // =============================
  Future<void> _cargarMesesGuardados() async {
    final prefs = await SharedPreferences.getInstance();

    final keys = prefs.getKeys();

    setState(() {
      mesesConDatos = keys
          .where((k) => k.startsWith('nomina_'))
          .map((k) => k.replaceFirst('nomina_', ''))
          .toSet();
    });
  }

  // =============================
  // 🔹 ABRIR MES
  // =============================
  Future<void> _abrirMes(BuildContext context, String mes, int dias) async {
    final prefs = await SharedPreferences.getInstance();

    final datosGuardados = prefs.getString('nomina_$mes');

    // =============================
    // 🔹 SI NO HAY DATOS
    // =============================
    if (datosGuardados == null) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PlantillaMes(mes: mes, diasMes: dias),
        ),
      );

      await _cargarMesesGuardados();

      return;
    }

    // =============================
    // 🔹 SI YA EXISTE → diálogo
    // =============================
    final resultado = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Nómina existente"),
        content: Text("Ya hay una nómina iniciada para $mes."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, "cancelar");
            },
            child: const Text("Cancelar"),
          ),

          TextButton(
            onPressed: () {
              Navigator.pop(context, "nueva");
            },
            child: const Text("Empezar nueva"),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, "continuar");
            },
            child: const Text("Continuar"),
          ),
        ],
      ),
    );

    // 🔹 CANCELAR
    if (resultado == null || resultado == "cancelar") {
      return;
    }

    // =============================
    // 🔹 CONTINUAR EDITANDO
    // =============================
    if (resultado == "continuar") {
      final data = jsonDecode(datosGuardados);

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PlantillaMes(
            mes: mes,
            diasMes: dias,
            datosGuardados: (data['diasSeleccionados'] as Map<String, dynamic>)
                .map(
                  (key, value) => MapEntry(int.parse(key), value.toString()),
                ),
          ),
        ),
      );

      await _cargarMesesGuardados();
    }

    // =============================
    // 🔹 EMPEZAR NUEVA
    // =============================
    if (resultado == "nueva") {
      await prefs.remove('nomina_$mes');

      await _cargarMesesGuardados();

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PlantillaMes(mes: mes, diasMes: dias),
        ),
      );

      await _cargarMesesGuardados();
    }
  }

  // =============================
  // 🔹 DÍAS DEL MES
  // =============================
  int _obtenerDiasMes(String mes) {
    switch (mes) {
      case "ENERO":
      case "MARZO":
      case "MAYO":
      case "JULIO":
      case "AGOSTO":
      case "OCTUBRE":
      case "DICIEMBRE":
        return 31;

      case "ABRIL":
      case "JUNIO":
      case "SEPTIEMBRE":
      case "NOVIEMBRE":
        return 30;

      case "FEBRERO":
        return 28;

      default:
        return 30;
    }
  }

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
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: meses.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    final nombreMes = meses[index]["nombre"]!;

                    final abreviado = meses[index]["abreviado"]!;

                    final tieneDatos = mesesConDatos.contains(nombreMes);

                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tieneDatos
                            ? const Color.fromARGB(255, 255, 120, 0)
                            : Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(8),
                      ),
                      onPressed: () {
                        final dias = _obtenerDiasMes(nombreMes);

                        _abrirMes(context, nombreMes, dias);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            abreviado,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          if (tieneDatos)
                            const Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Icon(
                                Icons.save,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HistorialNominas(),
                      ),
                    );
                  },
                  child: const Text(
                    "HISTORIAL NÓMINAS",
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
