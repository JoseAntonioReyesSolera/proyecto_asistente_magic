/* Pagina del asistente
  te pedira que uses un mazo, abriendo la pagina de mazos
  cargara las caras y te preguntara cual es tu mano que jugaras
  al pulsar el mazo tendras opciones, tus cartas de la mano tambien tendras opciones
  lo util es que te recuerde todo lo del campo de batalla
*/
/* Página principal del proyecto */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_asistente_magic/provider/deck_provider.dart';
import 'deck_manager_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? selectedDeck;

  @override
  Widget build(BuildContext context) {
    final deckProvider = Provider.of<DeckProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // Fondo decorativo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido principal
          if (selectedDeck == null)
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
                      value: selectedDeck,
                      hint: const Text(
                        'Selecciona un mazo',
                        style: TextStyle(color: Colors.white),
                      ),
                      items: deckProvider.decks.keys.map((String deckName) {
                        return DropdownMenuItem<String>(
                          value: deckName,
                          child: Text(
                            deckName,
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDeck = newValue;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DeckManagerPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: const Text('Gestionar Mazos'),
                    ),
                  ],
                ),
              ),
            )
          else
            Stack(
              children: [
                Center(
                  child: Text(
                    'Mazo Seleccionado: $selectedDeck',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedDeck = null; // Regresa a la selección de mazo
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.all(8),
                      shape: const CircleBorder(),
                      minimumSize: const Size(40, 40),
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
