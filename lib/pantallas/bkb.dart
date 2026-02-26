import 'package:flutter/material.dart';
import '../widgets/appbar_personalizado.dart';

class Bkb extends StatefulWidget {
  const Bkb({super.key});

  @override
  State<Bkb> createState() => _BkbState();
}

class _BkbState extends State<Bkb> {
  final _imageProvider = const AssetImage(
    'assets/imagenes/documentacion/bkb.png',
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
      appBar: const AppBarPersonalizado(titulo: "Código BKB Líneas"),
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
