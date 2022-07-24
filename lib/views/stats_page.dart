import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/bloc/pokemon_bloc.dart';
import 'package:pokedex/models/pokedex.dart';
import 'package:pokedex/widgets/color_selector.dart';

import 'package:pokedex/widgets/type_colors.dart';

class CharacteristicsPage extends StatefulWidget {
  Pokedex character;
  CharacteristicsPage({Key? key, required this.character}) : super(key: key);

  @override
  State<CharacteristicsPage> createState() => _CharacteristicsPageState();
}

class _CharacteristicsPageState extends State<CharacteristicsPage> {
  late Pokedex character;
  late var color;
  // List<Pokedex> stats= [character.stats[index].pokeStats.name];
  @override
  void initState() {
    // TODO: implement initState
    character = widget.character;
    color = colorSelector(character.types!.first.typeCategory!.name!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double bmi = character.weight! / pow(character.height!, 2);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(CupertinoIcons.back)),
        backgroundColor: color.withOpacity(0.15),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0),
          child: Divider(
            thickness: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: colorSelector(character.types!.first.typeCategory!.name!)
                  .withOpacity(0.15),
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.052),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          character.name!.capitalize!,
                          style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: character.types!.map((i) {
                            return character.types!.length == i.slot
                                ? Text(
                                    i.typeCategory!.name!.capitalize!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: TypeColors.labelColor),
                                  )
                                : Text(
                                    i.typeCategory!.name!.capitalize! + ', ',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: TypeColors.labelColor),
                                  );
                          }).toList(),
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                        Text(
                          "#" + character.id.toString().padLeft(3, '0'),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: TypeColors.labelColor),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(
                                "assets/images/pokeball_transparent.svg",
                                color: colorSelector(character
                                        .types!.first.typeCategory!.name!)
                                    .withOpacity(0.5),
                                fit: BoxFit.contain,
                                height: height * 0.2,
                                width: width * 0.2,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.network(
                                character.sprites!.other!.officialArtwork!
                                    .frontDefault!,
                                height: 125,
                                width: width * 0.35,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: height * 0.1,
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.052),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: TypeColors.fadedColor),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Text(
                          character.height.toString(),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: TypeColors.labelColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: TypeColors.fadedColor),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Text(
                          character.weight.toString(),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: TypeColors.labelColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "BMI",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: TypeColors.fadedColor),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Text(
                          bmi.toStringAsFixed(2),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: TypeColors.labelColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 10,
              color: Colors.grey[300],
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.052, top: height * 0.01),
              child: Container(
                height: height * 0.04,
                child: const Text(
                  "Base Stats",
                  style: TextStyle(
                    color: TypeColors.labelColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey[300],
            ),

            // BlocBuilder<PokemonBloc, PokemonState>(
            //   builder: (context, state) {
            //     if (state is PokemonLoaded) {
            //       return Container(
            //         height: height,
            //         color: Colors.greenAccent,
            //         child: TextButton(
            //           onPressed: () {
            //             if (state is PokemonLoaded) {
            //               state.favorites.contains(character)
            //                   ? context
            //                       .read<PokemonBloc>()
            //                       .add(RemoveFromFavorites(character))
            //                   : context
            //                       .read<PokemonBloc>()
            //                       .add(AddToFavorites(character));
            //             }
            //           },
            //           child: state.favorites.contains(character)
            //               ? Text("Remove From Favorites")
            //               : Text("Add To Favorites"),
            //         ),
            //       );
            //     } else {
            //       return SizedBox();
            //     }
            //   },
            // )
          ],
        ),
      ),
    );
  }

  // Widget BuildStats(BuildContext context, Pokedex character, Color color) {
  //   return Container(
  //     child: ListView.builder(
        
  //       itemBuilder: itemBuilder)
  //   )
  // }
}
