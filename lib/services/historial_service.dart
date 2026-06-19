import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/nomina_model.dart';

class HistorialService {
  static const _key = "historial_nominas";

  static Future<List<Nomina>> getNominas() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_key) ?? [];

    return data
        .map((e) => Nomina.fromJson(jsonDecode(e)))
        .toList()
        .reversed
        .toList();
  }

  static Future<void> guardarNomina(Nomina nomina) async {
    final prefs = await SharedPreferences.getInstance();
    final lista = prefs.getStringList(_key) ?? [];

    lista.add(jsonEncode(nomina.toJson()));

    await prefs.setStringList(_key, lista);
  }

  static Future<void> guardarLista(List<Nomina> nominas) async {
    final prefs = await SharedPreferences.getInstance();

    final lista = nominas.map((e) => jsonEncode(e.toJson())).toList();

    await prefs.setStringList(_key, lista);
  }
}
