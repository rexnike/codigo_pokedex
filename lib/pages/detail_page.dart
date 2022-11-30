import 'package:codigo_pokedex/models/pokemon_models.dart';
import 'package:codigo_pokedex/ui/widgets/item_data_widget.dart';
import 'package:codigo_pokedex/ui/widgets/item_type_widget.dart';
import 'package:flutter/material.dart';
import '../ui/widgets/general/colors.dart';


class DetailPage extends StatelessWidget {
  
  PokemonModel pokemon;

  DetailPage({required this.pokemon});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorsPokemon[pokemon.type.first],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.favorite_border_outlined,
            ),
            ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: height * 0.1,
            right: -30,
            child: Image.asset(
              "assets/image/pokeball.png",
              height: 200,
              color: Colors.white.withOpacity(0.2),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: 
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      pokemon.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),

                    Row(
                      children:
                        pokemon.type.map((e) => ItemTypeWidget(text: e)).toList(),
                    ),
                  ],
                ),
              Text(
                "#${pokemon.numPokemon}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
              ],
            ),
          ),

          Column(
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(),
                ),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                 decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                 ),
                 child: Stack(
                  clipBehavior: Clip.none,
                  children: [

                    //data del pokemon
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Column(
                        children: [
                          const Text(
                            "About Pokemon", 
                            style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            ),
                          ),
                          ItemDataWidget(
                            title: "Height",
                            data: pokemon.height,
                          ),
                          ItemDataWidget(
                            title: "Weight", 
                            data: "6.9 kg"),
                          ItemDataWidget(
                            title: "Candy", 
                            data: "Bulbasaur Candy"),
                          ItemDataWidget(
                            title: "Candy Count", 
                            data: "25"),
                        ],
                      ),
                    ),

                    //img del pokemon
                    Positioned.fill(
                      top: -90.0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.network(
                          pokemon.img,
                          ),
                      ),
                    ),
                  ],
                 ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}