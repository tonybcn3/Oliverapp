import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import '../widgets/appbar_personalizado.dart';

class Convenio extends StatefulWidget {
  const Convenio({super.key});

  @override
  State<Convenio> createState() => _ConvenioState();
}

class _ConvenioState extends State<Convenio> {
  late PdfControllerPinch _pdfController;

  @override
  void initState() {
    super.initState();

    _pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset(
        'assets/pdfs/convenio_viajeros_2026_2029.pdf',
      ),
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPersonalizado(titulo: "Convenio 2026-2029"),
      body: PdfViewPinch(controller: _pdfController),
    );
  }
}
