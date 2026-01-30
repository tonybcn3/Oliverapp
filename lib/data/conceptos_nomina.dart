/// =============================
/// MODELO CONCEPTO NÓMINA
/// =============================
class ConceptoNomina {
  final String clave;
  final String nombre;
  final double precio;
  final bool esDeduccion;

  const ConceptoNomina({
    required this.clave,
    required this.nombre,
    required this.precio,
    this.esDeduccion = false,
  });
}

/// =============================
/// CONCEPTOS DE LA NÓMINA
/// =============================
const Map<String, ConceptoNomina> conceptosNomina = {
  // 🔹 DEVENGOS
  "SALARIO_BASE": ConceptoNomina(
    clave: "SALARIO_BASE",
    nombre: "Salario Base",
    precio: 54.54,
  ),

  "ANTIGUEDAD": ConceptoNomina(
    clave: "ANTIGUEDAD",
    nombre: "Antigüedad",
    precio: 0, // ⚠️ NO SE USA
  ),

  "QMON": ConceptoNomina(
    clave: "QMON",
    nombre: "Quebranto de Moneda",
    precio: 2.28,
  ),

  "PSAB": ConceptoNomina(clave: "PSAB", nombre: "Plus Sábado", precio: 14.83),

  "PDOM": ConceptoNomina(
    clave: "PDOM",
    nombre: "Plus Domingo/Festivo",
    precio: 22.24,
  ),

  "DRED": ConceptoNomina(
    clave: "DRED",
    nombre: "Descanso Reducido",
    precio: 6.24,
  ),

  "HEST": ConceptoNomina(
    clave: "HEST",
    nombre: "Horas Estructurales",
    precio: 1.17,
  ),

  "PTRA": ConceptoNomina(clave: "PTRA", nombre: "Plus Traslado", precio: 15.83),

  "CPER": ConceptoNomina(
    clave: "CPER",
    nombre: "Conductor-Perceptor",
    precio: 5.37,
  ),

  "PNOC": ConceptoNomina(
    clave: "PNOC",
    nombre: "Plus Nocturnidad",
    precio: 1.34,
  ),

  "HADI": ConceptoNomina(
    clave: "HADI",
    nombre: "Horas Adicionales",
    precio: 14.66,
  ),

  "DCOT": ConceptoNomina(
    clave: "DCOT",
    nombre: "Dieta Cotizable",
    precio: 10.57,
  ),

  "FESTIVOS": ConceptoNomina(
    clave: "FESTIVOS",
    nombre: "Festivos Oficiales Trabajados",
    precio: 39.87, // ⚠️ Precio por cada festivo
  ),

  // 🔻 DEDUCCIONES
  "ANTICIPO": ConceptoNomina(
    clave: "ANTICIPO",
    nombre: "Anticipo",
    precio: 1200,
    esDeduccion: true,
  ),
};
