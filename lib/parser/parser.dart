List<String> parseDeckContent(String content) {
  final lines = content.split('\n'); // Dividimos por líneas
  final List<String> parsedLines = [];

  for (var line in lines) {
    final regex = RegExp(r'^(\d+)\s+(.+)$'); // Captura el número y el texto
    final match = regex.firstMatch(line);

    if (match != null) {
      final count = match.group(1)!; // Primer grupo: el número
      final name = match.group(2)!;  // Segundo grupo: el nombre de la carta
      final formattedName = name.replaceAll(' ', '-'); // Reemplazamos espacios
      parsedLines.add('$count,$formattedName'); // Guardamos el formato
    }
  }

  return parsedLines;
}
