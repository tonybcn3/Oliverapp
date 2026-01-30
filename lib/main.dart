import 'package:flutter/material.dart';
import 'pantallas/turnos.dart';
import 'pantallas/vacaciones.dart';
import 'pantallas/calendario_fiestas.dart';
import 'pantallas/documentacion.dart';
import 'pantallas/informacion.dart';
import 'pantallas/lista_videos_screen.dart';
import 'package:flutter/foundation.dart';
import 'pantallas/simulador_nominas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menú Principal',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MenuPrincipal(),
    );
  }
}

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isRelease = kReleaseMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "OLIVER",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: "app",
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 233, 120, 28),
                ),
              ),
            ],
          ),
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

      // 📍 BOTÓN INFO ABAJO Y CENTRADO
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: Opacity(opacity: value, child: child),
          );
        },
        child: FloatingActionButton.extended(
          backgroundColor: const Color.fromARGB(255, 233, 120, 28),
          icon: const Icon(Icons.info_outline),
          label: const Text(
            "Info",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          tooltip: "Información",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Informacion()),
            );
          },
        ),
      ),

      // ⭐ FONDO DEGRADADO SUAVE
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color.fromARGB(40, 233, 120, 28),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.count(
          padding: EdgeInsets.fromLTRB(
            20,
            isRelease ? 60 : 40, // 🔥 ajuste dinámico
            20,
            20,
          ),
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: isRelease ? 30 : 20,
          children: [
            _menuButton(
              context,
              icon: Icons.person,
              label: "Turnos",
              screen: const Turnos(),
            ),
            _menuButton(
              context,
              icon: Icons.beach_access,
              label: "Vacaciones",
              screen: const Vacaciones(),
            ),
            _menuButton(
              context,
              icon: Icons.calendar_month,
              label: "Calendario\nFiestas",
              screen: const CalendarioFiestas(),
            ),
            _menuButton(
              context,
              icon: Icons.menu_book,
              label: "Documentación",
              screen: const Documentacion(),
            ),

            // 👇 SOLO visible en debug / profile
            if (!kReleaseMode) ...[
              _menuButton(
                context,
                icon: Icons.video_library,
                label: "Vídeos",
                screen: const ListaVideosScreen(),
              ),
              _menuButton(
                context,
                icon: Icons.calculate,
                label: "Simulador\nde nóminas",
                screen: const SimuladorNominas(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _menuButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Widget screen,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 233, 120, 28),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
