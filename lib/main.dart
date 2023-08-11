import 'package:flutter/material.dart';
import 'package:rotating_shining_card/rotating_shining_card.dart';

/// The main entry point of the application.
void main() => runApp(const MyApp());

/// The root widget of the application.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] instance.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Rotating Shining Card Demo',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: RotatingShiningCard(
            width: 400,
            height: 560,
            image: 'assets/images/pokemon_card.png',
          ),
        ),
      ),
    );
  }
}
