import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import '../widgets/appbar_personalizado.dart';

class TablasSalariales22_25 extends StatefulWidget {
  const TablasSalariales22_25({super.key});

  @override
  State<TablasSalariales22_25> createState() => _TablasSalariales22_25State();
}

class _TablasSalariales22_25State extends State<TablasSalariales22_25> {
  late PdfControllerPinch _pdfController;

  @override
  void initState() {
    super.initState();

    _pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset(
        'assets/pdfs/tablas_salariales_2022_2025.pdf',
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
      appBar: const AppBarPersonalizado(titulo: "Tablas Salariales 2022-2025"),
      body: PdfViewPinch(
        controller: _pdfController,
        minScale: 1.0,
        maxScale: 5.0,
        onDocumentError: (error) {
          debugPrint('ERROR PDF TABLAS 2022-2025: $error');
        },
      ),
    );
  }
}
