import 'package:codigo_pokedex/pages/home_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PokedexApp",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
