import 'package:flutter/material.dart';
import '../widgets/appbar_personalizado.dart';

class ImagenGrande extends StatelessWidget {
  const ImagenGrande({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPersonalizado(titulo: "Vacaciones"),
      body: Center(
        child: InteractiveViewer(
          child: Image.asset(
            "assets/imagenes/cuadro_vacaciones/cuadro_vacaciones.jpg",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
