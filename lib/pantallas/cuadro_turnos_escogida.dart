import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // ← AÑADIR ESTA

class CuadroTurnosEscogida extends StatefulWidget {
  const CuadroTurnosEscogida({super.key});

  @override
  State<CuadroTurnosEscogida> createState() => _CuadroTurnosEscogidaState();
}

class _CuadroTurnosEscogidaState extends State<CuadroTurnosEscogida> {
  @override
  Widget build(BuildContext context) {
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
        constrained: false,
        minScale: 1.0,
        maxScale: 5.0,
        boundaryMargin: EdgeInsets.zero,
        child: Image.asset(
          'assets/imagenes/documentacion/cuadro_turnos_03_26.png',
          width: screenWidth,
          fit: BoxFit.fitWidth,

          // 🔑 Solo limitamos en iOS
          cacheHeight: (kIsWeb && defaultTargetPlatform == TargetPlatform.iOS)
              ? 4000
              : null,

          filterQuality: FilterQuality.high,
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text("Error al cargar imagen")),
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return AnimatedOpacity(
              opacity: frame == null ? 0 : 1,
              duration: const Duration(seconds: 1),
              curve: Curves.easeOut,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
