import 'package:flutter/material.dart';

class DeckManagerPage extends StatefulWidget {
  const DeckManagerPage({super.key});

  @override
  State<DeckManagerPage> createState() => _DeckManagerPageState();
}

class _DeckManagerPageState extends State<DeckManagerPage> {
  final List<String> decks = []; // Lista de mazos
  final TextEditingController _deckNameController = TextEditingController();
  final TextEditingController _newNameController = TextEditingController();

  void _addDeck(String deckName) {
    setState(() {
      decks.add(deckName);
    });
    _deckNameController.clear();
  }

  void _editDeckName(int index, String newName) {
    setState(() {
      decks[index] = newName;
    });
  }

  void _showEditDialog(int index) {
    _newNameController.text = decks[index];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Editar nombre del mazo"),
        content: TextField(
          controller: _newNameController,
          decoration: const InputDecoration(hintText: "Nuevo nombre"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              _editDeckName(index, _newNameController.text.trim());
              Navigator.of(context).pop();
            },
            child: const Text("Guardar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Mazos'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _deckNameController,
                    decoration: const InputDecoration(
                      labelText: "Nombre del mazo",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_deckNameController.text.trim().isNotEmpty) {
                      _addDeck(_deckNameController.text.trim());
                    }
                  },
                  child: const Text("Añadir"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Lógica para cargar archivo
              },
              icon: const Icon(Icons.upload_file),
              label: const Text("Cargar desde archivo"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: decks.isEmpty
                  ? const Center(
                      child: Text(
                        "No hay mazos guardados.",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: decks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(decks[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _showEditDialog(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
