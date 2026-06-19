import 'package:flutter/material.dart';
import '../models/nomina_model.dart';
import '../widgets/fondo_degradado.dart';
import 'package:intl/intl.dart';

class NominaDetalleHistorial extends StatelessWidget {
  final Nomina nomina;

  const NominaDetalleHistorial({super.key, required this.nomina});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nómina ${nomina.mes}"), centerTitle: true),
      body: FondoDegradado(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mes: ${nomina.mes}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Fecha: ${DateFormat('dd/MM/yyyy HH:mm').format(nomina.fecha)}",
              ),

              const SizedBox(height: 20),

              _fila("Bruto", nomina.bruto),
              _fila("Deducciones", nomina.deducciones),

              const Divider(height: 30, thickness: 2),

              Text(
                "Líquido a percibir: ${nomina.neto.toStringAsFixed(2)} €",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fila(String titulo, double valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(titulo), Text("${valor.toStringAsFixed(2)} €")],
      ),
    );
  }
}
