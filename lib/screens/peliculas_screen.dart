// peliculas_screen.dart
import 'package:flutter/material.dart';

class PeliculasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'Bienvenido a la pantalla de Películas',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
