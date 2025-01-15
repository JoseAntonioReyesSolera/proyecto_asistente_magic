import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_asistente_magic/provider/deck_provider.dart';

class DeckManagerPage extends StatelessWidget {
  const DeckManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final deckProvider = Provider.of<DeckProvider>(context);
    final TextEditingController _deckNameController = TextEditingController();
    final TextEditingController _deckContentController = TextEditingController();

    void _addDeck() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Añadir nuevo mazo'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _deckNameController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre del mazo',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _deckContentController,
                    decoration: const InputDecoration(
                      labelText: 'Contenido del mazo',
                    ),
                    maxLines: 10,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  final name = _deckNameController.text.trim();
                  final content = _deckContentController.text.trim();
                  if (name.isNotEmpty && content.isNotEmpty) {
                    deckProvider.addDeck(name, content);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Mazos'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: deckProvider.decks.isEmpty
            ? Center(
                child: Text('No hay Mazos'),
              )
            : ListView(
                children: deckProvider.decks.keys.map((deckName) {
                  return Card(
                    child: ListTile(
                      title: Text(deckName),
                      subtitle: const Text('Toca para editar o eliminar'),
                      onTap: () {
                        // Navegar o editar el mazo
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          deckProvider.deleteDeck(deckName);
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDeck,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
