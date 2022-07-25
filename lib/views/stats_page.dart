import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/bloc/pokemon_bloc.dart';
import 'package:pokedex/models/pokedex.dart';
import 'package:pokedex/widgets/color_selector.dart';
import 'package:pokedex/widgets/progress_bar.dart';

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
  //List<Pokedex> stats= [character.stats[index].pokeStats!.name!,character.stats[index].baseStat];
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
    double averagePower = 0;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
              icon: const Icon(CupertinoIcons.back)),
          backgroundColor:
              colorSelector(character.types!.first.typeCategory!.name!)
                  .withOpacity(0.5),
          elevation: 0,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: height * 0.25,
              automaticallyImplyLeading: false,
              backgroundColor: color.withOpacity(0.5),
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 0.5,
                          color: TypeColors.fadedColor,
                        ),
                      ),
                    ),
                    child: BuildThumbnail(context, character)),
              ),
              //forceElevated: innerBoxIsScrolled,
              //floating: true,

              pinned: false,
              snap: false,
              floating: false,
              // flexibleSpace:
              //     FlexibleSpaceBar(centerTitle: true, title: SizedBox()),
            )
          ],
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                padding:
                    EdgeInsets.only(left: width * 0.052, top: height * 0.01),
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
              SizedBox(
                height: height * 0.01,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: character.stats!.length,
                    itemBuilder: (BuildContext context, int index) {
                      averagePower += character.stats![index].baseStat!;

                      if (index >= character.stats!.length - 1) {
                        debugPrint("^^^" + index.toString());
                        averagePower = averagePower / index;
                        return ProgressBar(
                          statName: "Avg.-Power",
                          statValue: averagePower.toInt(),
                        );
                      }
                      return ProgressBar(
                          statName: character
                              .stats![index].pokeStats!.name!.capitalize!,
                          statValue: character.stats![index].baseStat!);
                    }),
              )
            ],
          ),
        ),
        floatingActionButton: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoaded) {
              return Theme(
                  data: Theme.of(context).copyWith(
                    floatingActionButtonTheme: FloatingActionButtonThemeData(
                      foregroundColor: state.favorites.contains(character)
                          ? TypeColors.floatingButtonColor
                          : Colors.white,
                      backgroundColor: state.favorites.contains(character)
                          ? TypeColors.removeFromFavorites
                          : TypeColors.floatingButtonColor,
                      extendedSizeConstraints:
                          state.favorites.contains(character)
                              ? BoxConstraints.tightFor(height: 50, width: 201)
                              : BoxConstraints.tightFor(height: 50, width: 157),
                    ),
                  ),
                  child: FloatingActionButton.extended(
                      onPressed: () {
                        if (state is PokemonLoaded) {
                          state.favorites.contains(character)
                              ? context
                                  .read<PokemonBloc>()
                                  .add(RemoveFromFavorites(character))
                              : context
                                  .read<PokemonBloc>()
                                  .add(AddToFavorites(character));
                        }
                      },
                      label: state.favorites.contains(character)
                          ? Text(
                              "Remove from favorites",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            )
                          : Text("Mark as favorite",
                              style: TextStyle(fontWeight: FontWeight.w700))));
            } else {
              return SizedBox.shrink();
            }
          },
        ));
  }

  Widget BuildThumbnail(BuildContext context, Pokedex character) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double bmi = character.weight! / pow(character.height!, 2);
    return Padding(
      padding: EdgeInsets.only(left: width * 0.052),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
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
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.02),
                child: Text(
                  "#" + character.id.toString().padLeft(3, '0'),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: TypeColors.labelColor),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                // height: height * 0.4,
                // width: width * 0.35,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        "assets/images/pokeball_transparent.svg",
                        color: colorSelector(
                                character.types!.first.typeCategory!.name!)
                            .withOpacity(0.5),
                        fit: BoxFit.contain,
                        height: height * 0.2,
                        width: width * 0.2,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.network(
                        character
                            .sprites!.other!.officialArtwork!.frontDefault!,
                        height: 125,
                        width: width * 0.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
