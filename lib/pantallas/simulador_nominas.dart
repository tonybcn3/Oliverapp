import 'package:flutter/material.dart';
import '../widgets/fondo_degradado.dart';
import 'seleccion_mes_nomina.dart';

class SimuladorNominas extends StatelessWidget {
  const SimuladorNominas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Simulador de nóminas",
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

      body: FondoDegradado(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),

              const Text(
                "¿Quieres calcular tu nómina para comprobar "
                "si coincide con la de la empresa?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 50),

              // 🔴 BOTÓN NO (arriba)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      vertical: 28,
                      horizontal: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "No, soy un conformista y me fío de lo que "
                    "me ha pagado la empresa",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🟢 BOTÓN SÍ (abajo)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      vertical: 28,
                      horizontal: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SeleccionMesNomina(),
                      ),
                    );
                  },
                  child: const Text(
                    "Sí, quiero comprobar si los importes "
                    "de mi nómina son correctos",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* 🔽 SUBMENÚ DEL SIMULADOR 🔽 */

class SubmenuSimuladorNominas extends StatelessWidget {
  const SubmenuSimuladorNominas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Simulación de nómina",
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
      body: FondoDegradado(
        child: const Center(
          child: Text(
            "Aquí empezará el cálculo de la nómina",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
