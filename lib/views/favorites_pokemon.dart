import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/controllers/bloc/pokemon_bloc.dart';
import 'package:pokedex/widgets/pokemon_widget.dart';

class FavoritesPokemon extends StatefulWidget {
  FavoritesPokemon({Key? key}) : super(key: key);

  @override
  State<FavoritesPokemon> createState() => _FavoritesPokemonState();
}

class _FavoritesPokemonState extends State<FavoritesPokemon> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokemonBloc, PokemonState>(
      listener: (context, state) {
        if (state is PokemonInitial) {
          context.read<PokemonBloc>().add(RequestPokemonList());
        }
      },
      builder: (context, state) {
        if (state is PokemonLoaded) {
          return CustomScrollView(slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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

                    return Hero(
                        tag: state.favorites[index].name!,
                        child:
                            PokemonWidget(character: state.favorites[index]));
                  },
                  childCount: state.favorites.length,
                ),
              ),
            ),
          ]);
        } else if (state is PokemonLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
