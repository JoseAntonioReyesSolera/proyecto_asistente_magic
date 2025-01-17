import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_asistente_magic/parser/parser.dart'; // Importar el parser
import 'package:proyecto_asistente_magic/parser/fetchCard.dart'; // Importar la función para obtener la carta
import 'package:proyecto_asistente_magic/almaz/carta.dart'; // Importar la clase Carta
import 'package:provider/provider.dart';
import 'package:proyecto_asistente_magic/provider/deck_provider.dart';

class AssistantPage extends StatefulWidget {
  final String? deckName; // Recibe el nombre del mazo

  const AssistantPage({Key? key, required this.deckName}) : super(key: key);

  @override
  State<AssistantPage> createState() => _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {
  late Future<List<Carta>> cards;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    cards = _getDeckCards();
  }

  // Función para obtener las cartas del mazo
  Future<List<Carta>> _getDeckCards() async {
    final deckProvider = Provider.of<DeckProvider>(context, listen: false);
    final deck = deckProvider.decks[widget.deckName];

    if (deck == null) {
      throw Exception('Mazo no encontrado');
    }

    // Paso 1: Parsear el contenido del mazo
    final parsedContent = parseDeckContent(deck);

    // Paso 2: Buscar cada carta a través de Scryfall
    List<Carta> cartaList = [];
    for (var parsed in parsedContent) {
      final parts = parsed.split(',');
      final cardName = parts[1]; // El nombre de la carta
      try {
        final carta = await fetchCarta(cardName); // Buscar la carta en Scryfall
        cartaList.add(carta); // Añadir la carta a la lista
      } catch (e) {
        // Si hay un error al buscar la carta, puedes manejarlo aquí
        print('Error al obtener carta $cardName: $e');
      }
    }
    return cartaList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo decorativo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Board_Anatomy_16_9.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido principal
          Center(
            child: FutureBuilder<List<Carta>>(
              future: cards,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text(
                    'No se pudieron cargar las cartas del mazo.',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  );
                } else {
                  // Mostrar las cartas obtenidas
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: snapshot.data!.map((carta) {
                      return Card(
                        color: Colors.transparent,
                        child: ListTile(
                          title: Text(
                            carta.name ?? 'Carta desconocida',
                            style: const TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          subtitle: Text(
                            carta.typeLine ?? 'Sin tipo',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
