import 'package:flutter/material.dart';
import '../widgets/appbar_personalizado.dart';

class TablaSalarial extends StatefulWidget {
  const TablaSalarial({super.key});

  @override
  State<TablaSalarial> createState() => _TablaSalarialState();
}

class _TablaSalarialState extends State<TablaSalarial> {
  final _imageProvider = const AssetImage(
    'assets/imagenes/documentacion/tablasalarial_24_25.png',
  );

  @override
  void didChangeDependencies() {
    precacheImage(_imageProvider, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const AppBarPersonalizado(titulo: "Tabla Salarial 2024-2025"),
      body: InteractiveViewer(
        constrained: false,
        minScale: 1.0,
        maxScale: 5.0,
        boundaryMargin: EdgeInsets.zero,
        child: Image(
          image: _imageProvider,
          width: screenWidth,
          fit: BoxFit.fitWidth,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
