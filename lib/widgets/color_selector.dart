import 'package:flutter/material.dart';
import 'package:pokedex/widgets/type_colors.dart';

Color colorSelector(String type) {
  switch (type) {
    case "grass":
    case "bug":
      return TypeColors.lightTeal;

    case "fire":
      return TypeColors.lightRed;

    case "water":
      return TypeColors.lightBlue;

    case "normal":
    case "flying":
      return TypeColors.semiGrey;

    case "fighting":
      return TypeColors.brown;

    case "electric":
    case "psychic":
      return TypeColors.lightYellow;

    case "poison":
    case "ghost":
      return TypeColors.lightPurple;

    case "ground":
    case "rock":
      return TypeColors.lightBrown;

    case "dark":
      return TypeColors.black;

    case 'fairy':
      return TypeColors.lightPink;

    default:
      return TypeColors.lightBlue;
  }
}