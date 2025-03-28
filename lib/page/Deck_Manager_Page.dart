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

    void _showDeckDialog(BuildContext context, DeckProvider deckProvider,
        {required bool isEditing, String? currentName}) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(isEditing ? 'Editar mazo' : 'Añadir nuevo mazo'),
            content: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _deckNameController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre del mazo',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _deckContentController,
                      decoration: const InputDecoration(
                        labelText: 'Contenido del mazo',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _deckNameController.clear();
                  _deckContentController.clear();
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  final name = _deckNameController.text.trim();
                  final content = _deckContentController.text.trim();
                  if (name.isNotEmpty && content.isNotEmpty) {
                    if (isEditing && currentName != null) {
                      // Editar mazo existente
                      deckProvider.updateDeck(currentName, name, content);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Mazo "$name" actualizado con éxito')),
                      );
                    } else {
                      // Añadir nuevo mazo
                      deckProvider.addDeck(name, content);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Mazo "$name" añadido con éxito')),
                      );
                    }
                    _deckNameController.clear();
                    _deckContentController.clear();
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Por favor completa todos los campos')),
                    );
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          );
        },
      );
    }

    void _addDeck() {
      _deckNameController.clear();
      _deckContentController.clear();
      _showDeckDialog(context, deckProvider, isEditing: false);
    }

    void _editDeck(String currentName, String currentContent) {
      _deckNameController.text = currentName;
      _deckContentController.text = currentContent;
      _showDeckDialog(context, deckProvider, isEditing: true, currentName: currentName);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Mazos'),
        backgroundColor: Colors.deepPurple,
      ),
      body: deckProvider.decks.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.deck, size: 100, color: Colors.grey),
                  const SizedBox(height: 20),
                  const Text(
                    'No hay mazos guardados',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: deckProvider.decks.keys.map((deckName) {
                final deckContent = deckProvider.decks[deckName]!;
                return Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text(deckName),
                    subtitle: const Text('Toca para editar o eliminar'),
                    onTap: () => _editDeck(deckName, deckContent),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        deckProvider.deleteDeck(deckName);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Mazo "$deckName" eliminado')),
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDeck,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
