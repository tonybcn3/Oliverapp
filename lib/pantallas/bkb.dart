import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import '../widgets/appbar_personalizado.dart';

class Bkb extends StatefulWidget {
  const Bkb({super.key});

  @override
  State<Bkb> createState() => _BkbPdfState();
}

class _BkbPdfState extends State<Bkb> {
  late final PdfControllerPinch controller;

  @override
  void initState() {
    super.initState();
    controller = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/pdfs/bkb.pdf'),
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
      appBar: const AppBarPersonalizado(titulo: "Código BKB Líneas"),
      body: PdfViewPinch(controller: controller),
    );
  }
}
