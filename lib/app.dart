import 'package:flutter/material.dart';
import 'package:pokemons/routes/routes.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemons',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black45,
            titleTextStyle: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                fontSize: 24),
          ),
          dividerTheme: const DividerThemeData(color: Colors.white10),
          iconTheme: const IconThemeData(
              color: Colors.white
          ),
          scaffoldBackgroundColor: Colors.teal,
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w400,
              fontSize: 22,
            ),
            bodyLarge: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 34,
            ),
          )),
      routes: routes,
    );
  }
}
