import 'package:flutter/material.dart';

class DeckProvider with ChangeNotifier {
  final Map<String, String> _decks = {}; // {nombre: contenido del mazo}

  Map<String, String> get decks => Map.unmodifiable(_decks);

  void addDeck(String name, String content) {
    _decks[name] = content;
    notifyListeners();
  }

  void updateDeck(String oldName, String newName, String newContent) {
    if (_decks.containsKey(oldName)) {
      _decks.remove(oldName);
      _decks[newName] = newContent;
      notifyListeners();
    }
  }

  void deleteDeck(String name) {
    _decks.remove(name);
    notifyListeners();
  }

  
}
