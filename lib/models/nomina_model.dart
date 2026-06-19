class Nomina {
  final String mes;
  final double bruto;
  final double deducciones;
  final double neto;
  final DateTime fecha;

  Nomina({
    required this.mes,
    required this.bruto,
    required this.deducciones,
    required this.neto,
    DateTime? fecha,
  }) : fecha = fecha ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'mes': mes,
      'bruto': bruto,
      'deducciones': deducciones,
      'neto': neto,
      'fecha': fecha.toIso8601String(),
    };
  }

  factory Nomina.fromJson(Map<String, dynamic> json) {
    return Nomina(
      mes: json['mes'],
      bruto: (json['bruto'] as num).toDouble(),
      deducciones: (json['deducciones'] as num).toDouble(),
      neto: (json['neto'] as num).toDouble(),
      fecha: DateTime.parse(json['fecha']),
    );
  }
}
