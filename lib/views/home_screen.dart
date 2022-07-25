import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pokedex/controllers/bloc/pokemon_bloc.dart';

import 'package:pokedex/widgets/pokemon_builder.dart';
import 'package:pokedex/widgets/type_colors.dart';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                      child: const Text(
                        "Pokedex",
                        style: TextStyle(
                            fontSize: 24,
                            color: TypeColors.labelColor,
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
                  const TabBar(
                    unselectedLabelColor: TypeColors.fadedColor,
                    labelColor: TypeColors.labelColor,
                    indicatorColor: TypeColors.indicatorColor,
                    indicatorWeight: 5,
                    tabs: [
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
          body: PokemonBuilder(),
        ));
  }
}
