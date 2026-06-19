import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/fondo_degradado.dart';
import '../widgets/colored_line.dart';
import '../models/nomina_model.dart';
import '../services/historial_service.dart';
import 'nomina_detalle_historial.dart';

class HistorialNominas extends StatefulWidget {
  const HistorialNominas({super.key});

  @override
  State<HistorialNominas> createState() => _HistorialNominasState();
}

class _HistorialNominasState extends State<HistorialNominas> {
  late Future<List<Nomina>> _future;

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  void _cargar() {
    _future = HistorialService.getNominas();
  }

  Future<void> _refresh() async {
    setState(() => _cargar());
  }

  Future<void> _eliminar(int index) async {
    final lista = await HistorialService.getNominas();

    lista.removeAt(index);

    await HistorialService.guardarLista(lista);

    setState(() => _cargar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historial nóminas"),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4),
          child: ColoredLine(),
        ),
      ),
      body: FondoDegradado(
        child: FutureBuilder<List<Nomina>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final nominas = snapshot.data ?? [];

            if (nominas.isEmpty) {
              return const Center(
                child: Text(
                  "No hay nóminas guardadas",
                  style: TextStyle(fontSize: 18),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: nominas.length,
                itemBuilder: (context, index) {
                  final nomina = nominas[index];

                  final fecha = DateFormat(
                    'dd/MM/yyyy HH:mm',
                  ).format(nomina.fecha);

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                NominaDetalleHistorial(nomina: nomina),
                          ),
                        );
                      },
                      title: Text("📅 ${nomina.mes}"),
                      subtitle: Text(
                        "Fecha: ${DateFormat('dd/MM/yyyy HH:mm').format(nomina.fecha)}\n"
                        "Líquido a percibir: ${nomina.neto.toStringAsFixed(2)} €",
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _eliminar(index),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
