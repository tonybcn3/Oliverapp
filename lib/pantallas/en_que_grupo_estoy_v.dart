import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import '../widgets/appbar_personalizado.dart';

class EnQueGrupoEstoy extends StatefulWidget {
  const EnQueGrupoEstoy({super.key});

  @override
  State<EnQueGrupoEstoy> createState() => _EnQueGrupoEstoyState();
}

class _EnQueGrupoEstoyState extends State<EnQueGrupoEstoy> {
  late final PdfControllerPinch controller;

  @override
  void initState() {
    super.initState();
    controller = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/pdfs/grupo_vacaciones.pdf'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPersonalizado(titulo: "¿En qué grupo estoy?"),
      body: PdfViewPinch(controller: controller),
    );
  }
}
