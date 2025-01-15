/* Pagina del asistente
  te pedira que uses un mazo, abriendo la pagina de mazos
  cargara las caras y te preguntara cual es tu mano que jugaras
  al pulsar el mazo tendras opciones, tus cartas de la mano tambien tendras opciones
  lo util es que te recuerde todo lo del campo de batalla
*/
/* Página principal del proyecto */
import 'package:flutter/material.dart';
import 'package:proyecto_asistente_magic/page/MazosGuardar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo decorativo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Asegúrate de agregar la imagen en la carpeta 'assets'
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido principal
          Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Elige tu Mazo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<String>(
                    dropdownColor: Colors.black,
                    value: null, // Inicialmente no hay mazo seleccionado
                    hint: const Text(
                      'Selecciona un mazo',
                      style: TextStyle(color: Colors.white),
                    ),
                    items: [
                      'Mazo 1',
                      'Mazo 2',
                      'Mazo 3',
                    ].map((String mazo) {
                      return DropdownMenuItem<String>(
                        value: mazo,
                        child: Text(
                          mazo,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? selectedMazo) {
                      if (selectedMazo != null) {
                        // Navega a la pantalla de mazos
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DeckManagerPage(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
