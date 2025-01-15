import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_asistente_magic/page/HomePage.dart';
import 'package:proyecto_asistente_magic/provider/deck_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DeckProvider()),
      ],
    child: const MyApp(),
    ),
  );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Asistente_MagicTCG',
        home: const Homepage(),
      );
  }
}