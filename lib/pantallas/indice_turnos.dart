import 'package:flutter/material.dart';
import '../widgets/appbar_personalizado.dart';

class IndiceTurnos extends StatefulWidget {
  const IndiceTurnos({super.key});

  @override
  State<IndiceTurnos> createState() => _IndiceTurnosState();
}

class _IndiceTurnosState extends State<IndiceTurnos> {
  final List<ImageProvider> _imagenes = const [
    AssetImage('assets/imagenes/turnos/indice_turnos_1.png'),
    AssetImage('assets/imagenes/turnos/indice_turnos_2.png'),
    AssetImage('assets/imagenes/turnos/indice_turnos_3.png'),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (final imagen in _imagenes) {
      precacheImage(imagen, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const AppBarPersonalizado(titulo: "Índice Turnos"),
      body: InteractiveViewer(
        constrained: false,
        alignment: Alignment.topLeft,
        minScale: 1.0,
        maxScale: 5.0,
        boundaryMargin: EdgeInsets.zero,
        panEnabled: true,
        scaleEnabled: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final imagen in _imagenes)
              Image(
                image: imagen,
                width: screenWidth,
                fit: BoxFit.fitWidth,
                filterQuality: FilterQuality.high,
                gaplessPlayback: true,
              ),
          ],
        ),
      ),
    );
  }
}
