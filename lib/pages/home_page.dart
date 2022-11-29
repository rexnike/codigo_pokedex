import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 


//uri permite identificar el recurso e identificarlo
//url funaciona como localisador del servidoor

getDataPokemon() async{
  Uri _uri = Uri.parse("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
  http.Response response = await http.get(_uri);
  print(response.statusCode);
  print(response.body);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Data"),
          onPressed: () {
            getDataPokemon();
          },
        ),
      ),
    );
  }
}