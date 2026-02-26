import 'package:flutter/material.dart';

class CuadroTurnosEscogida extends StatefulWidget {
  const CuadroTurnosEscogida({super.key});

  @override
  State<CuadroTurnosEscogida> createState() => _CuadroTurnosEscogidaState();
}

class _CuadroTurnosEscogidaState extends State<CuadroTurnosEscogida> {
  final _imageProvider = const AssetImage(
    'assets/imagenes/documentacion/cuadro_turnos_03_26.png',
  );

  @override
  void didChangeDependencies() {
    // CORRECCIÓN: Se llama a la función global precacheImage directamente
    precacheImage(_imageProvider, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // Obtenemos el ancho para que la imagen no se vea pequeña al inicio
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cuadro de turnos escogida",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
            height: 4,
            color: const Color.fromARGB(255, 233, 120, 28),
          ),
        ),
      ),
      body: InteractiveViewer(
        // Con 'constrained: false' permitimos que la imagen sea más larga que la pantalla
        // y el InteractiveViewer se encarga de hacer el scroll vertical automáticamente.
        constrained: false,
        minScale: 1.0,
        maxScale: 5.0,
        // Eliminamos márgenes para que encaje perfecta en los bordes
        boundaryMargin: EdgeInsets.zero,
        child: Image(
          image: _imageProvider,
          width: screenWidth, // Forzamos el ancho de la pantalla
          fit: BoxFit.fitWidth,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
