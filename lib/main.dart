import 'package:flutter/material.dart';
import 'pantallas/turnos.dart';
import 'pantallas/vacaciones.dart';
import 'pantallas/calendario_fiestas.dart';
import 'pantallas/documentacion.dart';
import 'pantallas/informacion.dart';
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

      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);

        return MediaQuery(
          data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },

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

        child: Padding(
          padding: EdgeInsets.fromLTRB(20, isRelease ? 80 : 60, 20, 20),

          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          Colors.black,
                          Color.fromARGB(255, 233, 120, 28),
                        ],
                      ).createShader(bounds),
                      child: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "OLIVER",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: "app",
                              style: TextStyle(
                                fontSize: 28,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Container(
                      width: 180,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 255, 170, 90),
                            Color.fromARGB(255, 233, 120, 28),
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(80, 233, 120, 28),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,

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
                ],
              ),

              const SizedBox(height: 20),

              InkWell(
                borderRadius: BorderRadius.circular(22),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SimuladorNominas()),
                  );
                },

                child: Container(
                  width: double.infinity,

                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 20,
                  ),

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 233, 120, 28),

                    borderRadius: BorderRadius.circular(22),

                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(90, 233, 120, 28),
                        blurRadius: 12,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),

                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        child: const Icon(
                          Icons.calculate,
                          color: Colors.white,
                          size: 34,
                        ),
                      ),

                      const SizedBox(width: 18),

                      Expanded(
                        child: Transform.translate(
                          offset: const Offset(-6, 0),

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: const [
                              Text(
                                "Simulador de",
                                textAlign: TextAlign.center,

                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 2),

                              Text(
                                "nóminas",
                                textAlign: TextAlign.center,

                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
      borderRadius: BorderRadius.circular(20),

      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },

      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 233, 120, 28),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(30, 0, 0, 0),
              blurRadius: 8,
              offset: Offset(2, 3),
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
