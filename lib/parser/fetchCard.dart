import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_asistente_magic/almaz/carta.dart';

Future<Carta> fetchCarta(String nombreCarta) async {
  final url = 'https://api.scryfall.com/cards/named?fuzzy=$nombreCarta';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // Si la respuesta es exitosa, se procesa el JSON y se crea la Carta
    return Carta.fromJson(json.decode(response.body)['data']);
  } else {
    // Si la respuesta no es exitosa, lanzamos una excepción
    throw Exception('Failed to load card');
  }
}
