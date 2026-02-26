/// =============================
/// MODELO TURNO
/// =============================
class Turno {
  final String codigo;
  final double qMon; // Quebranto Moneda
  final double pSab; // Plus Sábado
  final double pDom; // Plus Domingo
  final double dRed; // Descanso Reducido
  final double hEst; // Horas Estructurales
  final double pTra; // Plus Traslado
  final double cPer; // Conductor-Perceptor
  final double pNoc; // Nocturnidad
  final double hAdi; // Horas Adicionales
  final double dCot; // Dieta Cotizable

  const Turno({
    required this.codigo,
    this.qMon = 0.0,
    this.pSab = 0.0,
    this.pDom = 0.0,
    this.dRed = 0.0,
    this.hEst = 0.0,
    this.pTra = 0.0,
    this.cPer = 0.0,
    this.pNoc = 0.0,
    this.hAdi = 0.0,
    this.dCot = 0.0,
  });
}

/// =============================
/// SALARIO BASE (FIJO MENSUAL)
/// =============================
const int salarioBaseUnidades = 30;
const double salarioBaseUnitario = 54.54;

/// Importe oficial en nómina
const double salarioBaseTotal = 1636.09;

/// =============================
/// TURNOS LABORABLES
/// =============================
const Map<String, Turno> turnosLaborables = {
  "L-177": Turno(
    codigo: "L-177",
    qMon: 1,
    dRed: 1,
    hEst: 125,
    pTra: 10,
    cPer: 1,
    pNoc: 40,
    hAdi: 125,
    dCot: 0,
  ),
  "L-178": Turno(
    codigo: "L-178",
    qMon: 1,
    dRed: 1,
    hEst: 90,
    pTra: 10,
    cPer: 1,
    pNoc: 75,
    hAdi: 90,
    dCot: 1,
  ),
  "L-307": Turno(
    codigo: "L-307",
    qMon: 1,
    dRed: 1,
    hEst: 70,
    pTra: 5,
    cPer: 1,
    pNoc: 0,
    hAdi: 70,
    dCot: 0,
  ),
  "L-308": Turno(
    codigo: "L-308",
    qMon: 1,
    dRed: 1,
    hEst: 165,
    pTra: 5,
    cPer: 1,
    pNoc: 150,
    hAdi: 165,
    dCot: 2,
  ),
};

/// =============================
/// TURNOS SÁBADOS
/// =============================
const Map<String, Turno> turnosSabados = {
  "S-193": Turno(
    codigo: "S-193",
    qMon: 1,
    pSab: 1,
    dRed: 1,
    hEst: 125,
    pTra: 10,
    cPer: 1,
    pNoc: 50,
    hAdi: 125,
    dCot: 0,
  ),
  "S-194": Turno(
    codigo: "S-194",
    qMon: 1,
    pSab: 1,
    dRed: 1,
    hEst: 85,
    pTra: 10,
    cPer: 1,
    pNoc: 60,
    hAdi: 85,
    dCot: 0,
  ),
  "S-159": Turno(
    codigo: "S-159",
    qMon: 1,
    pSab: 1,
    dRed: 1,
    hEst: 70,
    pTra: 5,
    cPer: 1,
    pNoc: 0,
    hAdi: 70,
    dCot: 0,
  ),
  "S-160": Turno(
    codigo: "S-160",
    qMon: 1,
    pSab: 1,
    dRed: 1,
    hEst: 165,
    pTra: 5,
    cPer: 1,
    pNoc: 150,
    hAdi: 165,
    dCot: 2,
  ),
};

/// =============================
/// TURNOS DOMINGOS Y FESTIVOS
/// =============================
const Map<String, Turno> turnosDomingos = {
  "D-81": Turno(
    codigo: "D-81",
    qMon: 1,
    pDom: 1,
    dRed: 1,
    hEst: 95,
    pTra: 10,
    cPer: 1,
    pNoc: 35,
    hAdi: 95,
    dCot: 0,
  ),
  "D-82": Turno(
    codigo: "D-82",
    qMon: 1,
    pDom: 1,
    dRed: 1,
    hEst: 100,
    pTra: 10,
    cPer: 1,
    pNoc: 60,
    hAdi: 100,
    dCot: 0,
  ),
  "D-139": Turno(
    codigo: "D-139",
    qMon: 1,
    pDom: 1,
    dRed: 1,
    hEst: 70,
    pTra: 5,
    cPer: 1,
    pNoc: 0,
    hAdi: 70,
    dCot: 0,
  ),
  "D-140": Turno(
    codigo: "D-140",
    qMon: 1,
    pDom: 1,
    dRed: 1,
    hEst: 165,
    pTra: 5,
    cPer: 1,
    pNoc: 150,
    hAdi: 165,
    dCot: 2,
  ),
};

/// =============================
/// MAP GLOBAL (TODOS LOS TURNOS)
/// =============================
final Map<String, Turno> todosLosTurnos = {
  ...turnosLaborables,
  ...turnosSabados,
  ...turnosDomingos,
};

/// =============================
/// FUNCIÓN DE ACCESO A TURNO
/// =============================
Turno? obtenerTurno(String codigo) {
  return todosLosTurnos[codigo];
}

/// =============================
/// CÁLCULO DE NÓMINA MENSUAL
/// =============================
double calcularNominaMensual({required Map<int, String> diasSeleccionados}) {
  double total = salarioBaseTotal;

  for (final codigoTurno in diasSeleccionados.values) {
    final turno = obtenerTurno(codigoTurno);
    if (turno == null) continue;

    total +=
        turno.qMon +
        turno.pSab +
        turno.pDom +
        turno.dRed +
        turno.hEst +
        turno.pTra +
        turno.cPer +
        turno.pNoc +
        turno.hAdi +
        turno.dCot;
  }

  return total;
}
