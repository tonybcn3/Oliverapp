import 'package:flutter/material.dart';
import '../widgets/fondo_degradado.dart';
import '../widgets/colored_line.dart';
import '../data/turnos_data.dart';
import '../data/conceptos_nomina.dart';
import '../models/nomina_model.dart';
import '../services/historial_service.dart';

class NominaDetalle extends StatefulWidget {
  final Map<int, String> diasSeleccionados;
  final double antiguedad;
  final double irpf;
  final int festivosTrabajados;
  final String mes;

  const NominaDetalle({
    super.key,
    required this.diasSeleccionados,
    required this.antiguedad,
    required this.irpf,
    required this.mes,
    this.festivosTrabajados = 0,
  });

  @override
  State<NominaDetalle> createState() => _NominaDetalleState();
}

class _NominaDetalleState extends State<NominaDetalle> {
  @override
  Widget build(BuildContext context) {
    final unidades = _calcularUnidades();

    double totalDevengos = salarioBaseTotal;
    double totalDeducciones = 0;

    final List<Widget> filasDevengos = [];
    final List<Widget> filasDeducciones = [];

    // =============================
    // SALARIO BASE
    // =============================
    filasDevengos.add(
      _filaDevengo(
        concepto: "Salario Base",
        unidad: salarioBaseUnidades.toString(),
        precio: salarioBaseUnitario,
        total: salarioBaseTotal,
      ),
    );

    // =============================
    // ANTIGÜEDAD
    // =============================
    final importeAntiguedad = _calcularImporteAntiguedad(widget.antiguedad);
    if (importeAntiguedad > 0) {
      totalDevengos += importeAntiguedad;

      filasDevengos.add(
        _filaDevengo(
          concepto: "Antigüedad",
          unidad: "",
          precio: 0,
          total: importeAntiguedad,
        ),
      );
    }

    // =============================
    // PLUSES / TURNOS
    // =============================
    for (final entry in unidades.entries) {
      final concepto = conceptosNomina[entry.key];
      if (concepto == null || concepto.esDeduccion) continue;

      final importe = entry.value * concepto.precio;
      totalDevengos += importe;

      filasDevengos.add(
        _filaDevengo(
          concepto: concepto.nombre,
          unidad: entry.value.toStringAsFixed(2),
          precio: concepto.precio,
          total: importe,
        ),
      );
    }

    // =============================
    // FESTIVOS
    // =============================
    if (widget.festivosTrabajados > 0) {
      final precioFestivo = conceptosNomina["FESTIVOS"]?.precio ?? 0;
      final totalFestivo = widget.festivosTrabajados * precioFestivo;
      totalDevengos += totalFestivo;

      filasDevengos.add(
        _filaDevengo(
          concepto: "Festivos Oficiales Trabajados",
          unidad: widget.festivosTrabajados.toString(),
          precio: precioFestivo,
          total: totalFestivo,
        ),
      );
    }

    final totalBruto = totalDevengos;

    // =====================================================
    // 🔵 IRPF (RESTAURADO CON DESGLOSE)
    // =====================================================
    double totalIrpf = 0;

    if (widget.irpf > 0) {
      totalIrpf = totalBruto * widget.irpf / 100;
      totalDeducciones += totalIrpf;

      filasDeducciones.add(const SizedBox(height: 12));

      filasDeducciones.add(_tituloDeduccion("RETENCIÓN I.R.P.F."));

      filasDeducciones.add(
        _filaTriple(
          col1: "BASE IRPF",
          col2: "%",
          col3: "IMPORTE",
          esTitulo: true,
        ),
      );

      filasDeducciones.add(
        _filaTriple(
          col1: totalBruto.toStringAsFixed(2),
          col2: widget.irpf.toStringAsFixed(2),
          col3: "-${totalIrpf.toStringAsFixed(2)}",
        ),
      );
    }

    // =====================================================
    // 🟠 SEGURIDAD SOCIAL (DESGLOSE COMPLETO RESTAURADO)
    // =====================================================
    final diasMes = widget.diasSeleccionados.length;

    final prorrataPagasExtra =
        ((salarioBaseTotal + importeAntiguedad) / 365) * diasMes * 3;

    final baseSS = totalBruto + prorrataPagasExtra;

    const double pctContingencias = 4.70;
    const double pctMei = 0.15;
    const double pctDesempleo = 1.55;
    const double pctFormacion = 0.10;

    final contingencias = baseSS * pctContingencias / 100;
    final mei = baseSS * pctMei / 100;
    final desempleo = baseSS * pctDesempleo / 100;
    final formacion = baseSS * pctFormacion / 100;

    final totalSS = contingencias + mei + desempleo + formacion;
    totalDeducciones += totalSS;

    filasDeducciones.add(const SizedBox(height: 16));

    filasDeducciones.add(_tituloDeduccion("RETENCIÓN SEGURIDAD SOCIAL"));

    filasDeducciones.add(
      _filaTriple(
        col1: "BASE",
        col2: "PRORRATA PAGAS EXTRA",
        col3: "TOTAL",
        esTitulo: true,
      ),
    );

    filasDeducciones.add(
      _filaTriple(
        col1: totalBruto.toStringAsFixed(2),
        col2: prorrataPagasExtra.toStringAsFixed(2),
        col3: baseSS.toStringAsFixed(2),
      ),
    );

    filasDeducciones.add(
      _filaTriple(
        col1: "Contingencias",
        col2: "${pctContingencias.toStringAsFixed(2)}%",
        col3: "-${contingencias.toStringAsFixed(2)}",
      ),
    );

    filasDeducciones.add(
      _filaTriple(
        col1: "MEI",
        col2: "${pctMei.toStringAsFixed(2)}%",
        col3: "-${mei.toStringAsFixed(2)}",
      ),
    );

    filasDeducciones.add(
      _filaTriple(
        col1: "Desempleo",
        col2: "${pctDesempleo.toStringAsFixed(2)}%",
        col3: "-${desempleo.toStringAsFixed(2)}",
      ),
    );

    filasDeducciones.add(
      _filaTriple(
        col1: "Formación",
        col2: "${pctFormacion.toStringAsFixed(2)}%",
        col3: "-${formacion.toStringAsFixed(2)}",
      ),
    );

    filasDeducciones.add(
      _filaTriple(
        col1: "TOTAL SS",
        col2: "",
        col3: "-${totalSS.toStringAsFixed(2)}",
        esTitulo: true,
      ),
    );

    // =============================
    // ANTICIPO
    // =============================
    final anticipo = conceptosNomina["ANTICIPO"]?.precio ?? 0;
    if (anticipo > 0) {
      totalDeducciones += anticipo;

      filasDeducciones.add(
        _filaDeduccion(concepto: "Anticipo", detalle: "", importe: anticipo),
      );
    }

    final neto = totalBruto - totalDeducciones;

    // =============================
    // UI
    // =============================
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle nómina - ${widget.mes}"),
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
                  _cabeceraDevengos(),
                  ...filasDevengos,
                  const Divider(thickness: 2),
                  _filaTotal("TOTAL BRUTO", totalBruto),
                  const SizedBox(height: 24),
                  ...filasDeducciones,
                  const Divider(thickness: 2),
                  _filaTotal("TOTAL DEDUCCIONES", totalDeducciones),
                  _filaTotal("NETO A PERCIBIR", neto),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        final nomina = Nomina(
                          mes: widget.mes,
                          fecha: DateTime.now(),
                          bruto: totalBruto,
                          deducciones: totalDeducciones,
                          neto: neto,
                        );

                        await HistorialService.guardarNomina(nomina);

                        if (!mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Nómina guardada en historial"),
                          ),
                        );
                      },
                      child: const Text("GUARDAR EN HISTORIAL"),
                    ),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade800,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).popUntil((route) => route.isFirst);
                      },
                      child: const Text("SALIR"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // ANTIGÜEDAD
  // =========================================================
  double _calcularImporteAntiguedad(double anos) {
    if (anos < 2) return 0;
    if (anos <= 3) return 32.61;
    if (anos <= 8) return 65.22;
    if (anos <= 13) return 130.46;
    if (anos <= 18) return 195.67;
    if (anos <= 23) return 260.89;
    if (anos <= 28) return 326.11;
    return 391.33;
  }

  // =========================================================
  // UNIDADES
  // =========================================================
  Map<String, double> _calcularUnidades() {
    final Map<String, double> resultado = {};

    void sumar(String clave, double valor) {
      if (valor == 0) return;
      resultado[clave] = (resultado[clave] ?? 0) + valor;
    }

    for (final codigo in widget.diasSeleccionados.values) {
      final turno =
          turnosLaborables[codigo] ??
          turnosSabados[codigo] ??
          turnosDomingos[codigo];

      if (turno == null) continue;

      sumar("QMON", turno.qMon);
      sumar("PSAB", turno.pSab);
      sumar("PDOM", turno.pDom);
      sumar("DRED", turno.dRed);

      sumar("HEST", turno.hEst);
      sumar("PTRA", turno.pTra);
      sumar("PNOC", turno.pNoc);
      sumar("HADI", turno.hAdi);

      sumar("CPER", turno.cPer);
      sumar("DCOT", turno.dCot);
    }

    const clavesMinutos = ["HEST", "PTRA", "PNOC", "HADI"];
    for (final clave in clavesMinutos) {
      if (resultado.containsKey(clave)) {
        resultado[clave] = resultado[clave]! / 60;
      }
    }

    if (resultado.containsKey("PDOM")) {
      resultado["PDOM"] = (resultado["PDOM"]! - widget.festivosTrabajados)
          .clamp(0, double.infinity);
    }

    return resultado;
  }

  // =============================
  // WIDGETS UI
  // =============================
  Widget _tituloDeduccion(String texto) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            texto,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    ),
  );

  Widget _filaTriple({
    required String col1,
    required String col2,
    required String col3,
    bool esTitulo = false,
  }) {
    final style = esTitulo
        ? const TextStyle(fontWeight: FontWeight.bold)
        : null;

    return Row(
      children: [
        Expanded(child: Text(col1, style: style)),
        Expanded(
          child: Text(col2, style: style, textAlign: TextAlign.center),
        ),
        Expanded(
          child: Text(col3, style: style, textAlign: TextAlign.right),
        ),
      ],
    );
  }

  Widget _cabeceraDevengos() {
    return const Row(
      children: [
        Expanded(flex: 3, child: Text("CONCEPTO")),
        Expanded(child: Text("UNID.", textAlign: TextAlign.center)),
        Expanded(child: Text("PRECIO", textAlign: TextAlign.center)),
        Expanded(child: Text("TOTAL", textAlign: TextAlign.center)),
      ],
    );
  }

  Widget _filaDevengo({
    required String concepto,
    required String unidad,
    required double precio,
    required double total,
  }) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text(concepto)),
        Expanded(child: Text(unidad, textAlign: TextAlign.center)),
        Expanded(child: Text(precio == 0 ? "" : precio.toStringAsFixed(2))),
        Expanded(child: Text(total.toStringAsFixed(2))),
      ],
    );
  }

  Widget _filaDeduccion({
    required String concepto,
    required String detalle,
    double? importe,
  }) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text(concepto)),
        Expanded(child: Text(detalle)),
        Expanded(
          child: Text(
            importe == null ? "" : "-${importe.toStringAsFixed(2)}",
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Widget _filaTotal(String texto, double importe) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            texto,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Text(
            importe.toStringAsFixed(2),
            textAlign: TextAlign.right,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
