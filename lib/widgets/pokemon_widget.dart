import 'package:flutter/material.dart';
import 'package:pokedex/models/pokedex.dart';
import 'package:pokedex/views/stats_page.dart';
import 'package:pokedex/widgets/color_selector.dart';
import 'package:pokedex/widgets/type_colors.dart';

class PokemonWidget extends StatefulWidget {
  Pokedex character;
  PokemonWidget({Key? key, required this.character}) : super(key: key);

  @override
  State<PokemonWidget> createState() => _PokemonWidgetState();
}

class _PokemonWidgetState extends State<PokemonWidget> {
  late Pokedex character;
  @override
  void initState() {
    // TODO: implement initState
    character = widget.character;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CharacteristicsPage(
                character: character,
              ))),
      child: SizedBox(
        height: 184,
        width: 110,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.min,

              children: [
                Container(
                  color:
                      colorSelector(character.types!.first.typeCategory!.name!)
                          .withOpacity(0.3),
                  child: Image.network(
                    character.sprites!.other!.officialArtwork!.frontDefault!,
                    fit: BoxFit.contain,
                    height: 104,
                    width: width * 0.3,
                  ),
                  // child: SvgPicture.asset(
                  //   "assets/images/pokeball_transparent.svg",
                  //   color: colorSelector(
                  //           character.types!.first.typeCategory!.name!)
                  //       .withOpacity(0.5),
                  //   fit: BoxFit.contain,
                  //   height: 104,
                  //   width: width * 0.277,
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "#" + character.id.toString().padLeft(3, '0'),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: TypeColors.fadedColor),
                      ),
                      Text(
                        character.name!.capitalize(),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: character.types!.map((i) {
                          return character.types!.length == i.slot
                              ? Text(
                                  i.typeCategory!.name!.capitalize(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: TypeColors.labelColor),
                                )
                              : Text(
                                  i.typeCategory!.name!.capitalize() + ', ',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: TypeColors.labelColor),
                                );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
