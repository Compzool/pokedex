import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/models/pokedex.dart';
import 'package:pokedex/controllers/bloc/pokemon_bloc.dart';
import 'package:pokedex/views/stats_page.dart';
import 'package:pokedex/widgets/color_selector.dart';
import 'package:pokedex/widgets/constants.dart';
import 'package:pokedex/widgets/hex_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    // context.read<PokemonBloc>().add(InitCall());
    context.read<PokemonBloc>().add(RequestPokemonList());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: SvgPicture.asset(
                      'assets/images/pokeball.svg',
                      fit: BoxFit.contain,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Pokedex",
                      style: TextStyle(
                          fontSize: 24,
                          color: pokedexColor,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              )
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.08),
            child: Column(
              children: [
                Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                ),
                TabBar(
                  unselectedLabelColor: unselectedLabelColor,
                  labelColor: labelColor,
                  indicatorColor: indicatorColor,
                  indicatorWeight: 5,
                  tabs: const [
                    Tab(
                      child: Text(
                        'All Pokemon',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Favorites',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: BlocConsumer<PokemonBloc, PokemonState>(
          listener: (context, state) {
            if (state is PokemonInitial) {
              context.read<PokemonBloc>().add(RequestPokemonList());
            }
          },
          builder: (context, state) {
            if (state is PokemonLoaded) {
              return TabBarView(
                children: [
                  CustomScrollView(slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(8),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 190,
                          crossAxisCount: 3,
                          crossAxisSpacing: 0.277,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          //API CALL - CONTROLLER TAKES THE API CALL AND MAKES A LIST.
                          (context, index) {
                            debugPrint(
                                "Type 1: ${state.list[index].types!.first.toJson()}");

                            return BuildPokemon(context, state.list[index]);
                          },
                          childCount: state.list.length,
                        ),
                      ),
                    ),
                  ]),
                  CustomScrollView(slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(8),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 190,
                          crossAxisCount: 3,
                          crossAxisSpacing: 0.277,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          //API CALL - CONTROLLER TAKES THE API CALL AND MAKES A LIST.
                          (context, index) {
                            debugPrint(
                                "Type 1: ${state.favorites[index].types!.first.toJson()}");

                            return BuildPokemon(
                                context, state.favorites[index]);
                          },
                          childCount: state.favorites.length,
                        ),
                      ),
                    ),
                  ]),
                ],
              );
            } else if (state is PokemonLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget BuildPokemon(BuildContext context, Pokedex character) {
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
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: unselectedLabelColor),
                      ),
                      Text(
                        character.name!.capitalize(),
                        style: TextStyle(
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
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: unselectedLabelColor),
                                )
                              : Text(
                                  i.typeCategory!.name!.capitalize() + ', ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: unselectedLabelColor),
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
