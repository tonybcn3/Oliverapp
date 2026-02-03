import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import '../widgets/appbar_personalizado.dart';

class Festivos extends StatefulWidget {
  const Festivos({super.key});

  @override
  State<Festivos> createState() => _FestivosState();
}

class _FestivosState extends State<Festivos> {
  late final PdfControllerPinch controller;

  @override
  void initState() {
    super.initState();
    controller = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/pdfs/festivos.pdf'),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPersonalizado(titulo: "Festivos"),
      body: PdfViewPinch(controller: controller),
    );
  }
}
