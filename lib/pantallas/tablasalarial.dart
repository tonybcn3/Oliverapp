import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import '../widgets/appbar_personalizado.dart';

class TablaSalarial extends StatefulWidget {
  const TablaSalarial({super.key});

  @override
  State<TablaSalarial> createState() => _TablaSalarialState();
}

class _TablaSalarialState extends State<TablaSalarial> {
  late final PdfControllerPinch controller;

  @override
  void initState() {
    super.initState();
    controller = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/pdfs/tablasalarial_24_25.pdf'),
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
      appBar: const AppBarPersonalizado(titulo: "Tabla Salarial 2024-2025"),
      body: PdfViewPinch(controller: controller),
    );
  }
}
