import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart'; // Asegúrate de tener pdfx en pubspec.yaml

class CuadroTurnosEscogida extends StatefulWidget {
  const CuadroTurnosEscogida({super.key});

  @override
  State<CuadroTurnosEscogida> createState() => _CuadroTurnosEscogidaState();
}

class _CuadroTurnosEscogidaState extends State<CuadroTurnosEscogida> {
  late PdfController pdfController;

  @override
  void initState() {
    super.initState();
    pdfController = PdfController(
      document: PdfDocument.openAsset('assets/pdfs/cuadro_turnos.pdf'),
    );
  }

  @override
  void dispose() {
    pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cuadro de turnos escogida",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: PdfView(
        controller: pdfController,
        scrollDirection: Axis.vertical, // Permite desplazarse por el PDF
      ),
    );
  }
}
