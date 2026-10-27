import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import '../widgets/appbar_personalizado.dart';

class TablasSalariales26_29 extends StatefulWidget {
  const TablasSalariales26_29({super.key});

  @override
  State<TablasSalariales26_29> createState() => _TablasSalariales26_29State();
}

class _TablasSalariales26_29State extends State<TablasSalariales26_29> {
  late PdfControllerPinch _pdfController;

  @override
  void initState() {
    super.initState();

    _pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset(
        'assets/pdfs/tablas_salariales_2026_2029.pdf',
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
      appBar: const AppBarPersonalizado(titulo: "Tablas Salariales 2026-2029"),
      body: PdfViewPinch(controller: _pdfController),
    );
  }
}
