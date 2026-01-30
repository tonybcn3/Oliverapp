import 'package:flutter/material.dart';
import '../widgets/fondo_degradado.dart';
import '../widgets/colored_line.dart';
import '../data/turnos_data.dart';
import '../data/conceptos_nomina.dart';

class NominaDetalle extends StatelessWidget {
  final Map<int, String> diasSeleccionados;
  final double antiguedad;
  final double irpf;
  final int festivosTrabajados; // <-- Nuevo dato

  const NominaDetalle({
    super.key,
    required this.diasSeleccionados,
    required this.antiguedad,
    required this.irpf,
    this.festivosTrabajados = 0, // valor por defecto
  });

  @override
  Widget build(BuildContext context) {
    final unidades = _calcularUnidades();

    double totalDevengos = salarioBaseTotal;
    double totalDeducciones = 0;

    final List<Widget> filasDevengos = [];
    final List<Widget> filasDeducciones = [];

    /// =============================
    /// SALARIO BASE
    /// =============================
    filasDevengos.add(
      _filaDevengo(
        concepto: "Salario Base",
        unidad: salarioBaseUnidades.toString(),
        precio: salarioBaseUnitario,
        total: salarioBaseTotal,
      ),
    );

    /// =============================
    /// ANTIGÜEDAD
    /// =============================
    final importeAntiguedad = _calcularImporteAntiguedad(antiguedad);
    if (importeAntiguedad > 0) {
      totalDevengos += importeAntiguedad;

      filasDevengos.add(
        _filaDevengo(
          concepto: "Antigüedad",
          unidad: "", // columna UNID. vacía
          precio: 0,
          total: importeAntiguedad,
        ),
      );
    }

    /// =============================
    /// PLUSES / TURNOS
    /// =============================
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

    /// =============================
    /// FESTIVOS OFICIALES TRABAJADOS
    /// =============================
    if (festivosTrabajados > 0) {
      final precioFestivo = conceptosNomina["FESTIVOS"]?.precio ?? 0;
      final totalFestivo = festivosTrabajados * precioFestivo;
      totalDevengos += totalFestivo;

      filasDevengos.add(
        _filaDevengo(
          concepto: "Festivos Oficiales Trabajados",
          unidad: festivosTrabajados.toString(),
          precio: precioFestivo,
          total: totalFestivo,
        ),
      );
    }

    /// =============================
    /// TOTAL BRUTO
    /// =============================
    final totalBruto = totalDevengos;

    /// =============================
    /// IRPF (BASE IRPF)
    /// =============================
    if (irpf > 0) {
      final baseIrpf = totalBruto;
      final importeIrpf = baseIrpf * irpf / 100;
      totalDeducciones += importeIrpf;

      filasDeducciones.add(const SizedBox(height: 12));

      // Título centrado con líneas
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
          col1: baseIrpf.toStringAsFixed(2),
          col2: irpf.toStringAsFixed(2),
          col3: "-${importeIrpf.toStringAsFixed(2)}",
        ),
      );
    }

    /// =============================
    /// SEGURIDAD SOCIAL
    /// =============================
    final remuneracionTotal = totalBruto;
    final diasMes = diasSeleccionados.length;
    final basePagasExtra = salarioBaseTotal + importeAntiguedad;
    final prorrataPagasExtra = (basePagasExtra * 3 / 365) * diasMes;
    final totalSeguridadSocial = remuneracionTotal + prorrataPagasExtra;

    filasDeducciones.add(const SizedBox(height: 16));

    // Título centrado con líneas
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
        col1: remuneracionTotal.toStringAsFixed(2),
        col2: prorrataPagasExtra.toStringAsFixed(2),
        col3: totalSeguridadSocial.toStringAsFixed(2),
      ),
    );

    /// =============================
    /// DEDUCCIONES SEGURIDAD SOCIAL
    /// =============================
    const double pctContingencias = 4.70;
    const double pctMei = 0.13;
    const double pctDesempleo = 1.55;
    const double pctFormacion = 0.10;

    final double baseSeguridadSocial = totalSeguridadSocial;

    final double contingencias = baseSeguridadSocial * pctContingencias / 100;
    final double mei = baseSeguridadSocial * pctMei / 100;
    final double desempleo = baseSeguridadSocial * pctDesempleo / 100;
    final double formacion = baseSeguridadSocial * pctFormacion / 100;

    final double totalSeguridadSocialTrabajador =
        contingencias + mei + desempleo + formacion;

    totalDeducciones += totalSeguridadSocialTrabajador;

    filasDeducciones.add(const SizedBox(height: 16));

    filasDeducciones.add(
      _filaTriple(
        col1: "Contingencias Comunes",
        col2: "${pctContingencias.toStringAsFixed(2)} %",
        col3: "-${contingencias.toStringAsFixed(2)}",
      ),
    );

    filasDeducciones.add(
      _filaTriple(
        col1: "MEI",
        col2: "${pctMei.toStringAsFixed(2)} %",
        col3: "-${mei.toStringAsFixed(2)}",
      ),
    );

    filasDeducciones.add(
      _filaTriple(
        col1: "Desempleo",
        col2: "${pctDesempleo.toStringAsFixed(2)} %",
        col3: "-${desempleo.toStringAsFixed(2)}",
      ),
    );

    filasDeducciones.add(
      _filaTriple(
        col1: "Formación Profesional",
        col2: "${pctFormacion.toStringAsFixed(2)} %",
        col3: "-${formacion.toStringAsFixed(2)}",
      ),
    );

    filasDeducciones.add(
      _filaTriple(
        col1: "TOTAL",
        col2: "",
        col3: "-${totalSeguridadSocialTrabajador.toStringAsFixed(2)}",
        esTitulo: true,
      ),
    );

    /// =============================
    /// ANTICIPO
    /// =============================
    final anticipo = conceptosNomina["ANTICIPO"]?.precio ?? 0;
    if (anticipo > 0) {
      totalDeducciones += anticipo;

      filasDeducciones.add(
        _filaDeduccion(concepto: "Anticipo", detalle: "", importe: anticipo),
      );
    }

    /// =============================
    /// UI
    /// =============================
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detalle de la nómina",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4),
          child: ColoredLine(),
        ),
      ),
      body: FondoDegradado(
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
            _filaTotal("NETO A PERCIBIR", totalBruto - totalDeducciones),
          ],
        ),
      ),
    );
  }

  /// =============================
  /// TÍTULO DEDUCCIÓN CENTRADO CON LÍNEAS
  /// =============================
  Widget _tituloDeduccion(String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const Expanded(child: Divider(thickness: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              texto,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Expanded(child: Divider(thickness: 1)),
        ],
      ),
    );
  }

  /// =============================
  /// ANTIGÜEDAD POR TRAMOS
  /// =============================
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

  /// =============================
  /// CÁLCULO DE UNIDADES
  /// =============================
  Map<String, double> _calcularUnidades() {
    final Map<String, double> resultado = {};

    void sumar(String clave, double valor) {
      if (valor == 0) return;
      resultado[clave] = (resultado[clave] ?? 0) + valor;
    }

    for (final codigo in diasSeleccionados.values) {
      final turno = obtenerTurno(codigo);
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

    return resultado;
  }

  /// =============================
  /// UI COMPONENTES
  /// =============================
  Widget _filaTriple({
    required String col1,
    required String col2,
    required String col3,
    bool esTitulo = false,
  }) {
    final estilo = esTitulo
        ? const TextStyle(fontWeight: FontWeight.bold)
        : const TextStyle();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(col1, style: estilo, textAlign: TextAlign.center),
          ),
          Expanded(
            child: Text(col2, style: estilo, textAlign: TextAlign.center),
          ),
          Expanded(
            child: Text(col3, style: estilo, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  Widget _cabeceraDevengos() {
    return Row(
      children: const [
        Expanded(
          flex: 3,
          child: Text(
            "CONCEPTO",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(concepto)),
          Expanded(child: Text(unidad, textAlign: TextAlign.center)),
          Expanded(
            child: Text(
              precio == 0 ? "" : precio.toStringAsFixed(2),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(total.toStringAsFixed(2), textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  Widget _filaDeduccion({
    required String concepto,
    required String detalle,
    double? importe,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(concepto)),
          Expanded(child: Text(detalle, textAlign: TextAlign.center)),
          Expanded(
            child: Text(
              importe == null ? "" : "-${importe.toStringAsFixed(2)}",
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _filaTotal(String texto, double importe) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
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
      ),
    );
  }
}
