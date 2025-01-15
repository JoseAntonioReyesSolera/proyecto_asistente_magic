/* Página de menú
   para iniciar el asistente
   y ver y guardar los mazos
*/
import 'package:flutter/material.dart';
import 'package:proyecto_asistente_magic/page/MazosGuardar.dart';
import 'package:proyecto_asistente_magic/page/Principal.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MagicTCG Assistant'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Asistente MagicTCG',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => MainPage(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Iniciar',
                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold,),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => DeckManagerPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Ver Mazos',
                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
