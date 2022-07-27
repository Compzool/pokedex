import 'package:flutter/material.dart';
import 'package:pokedex/widgets/type_colors.dart';
import 'package:pokedex/widgets/pokemon_widget.dart';

class ProgressBar extends StatelessWidget {
  int statValue;
  String statName;
  ProgressBar({Key? key, required this.statName, required this.statValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    statName =
        statName.split("-").map((String) => String.capitalize()).join(" ");
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.052),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                statName,
                style: TextStyle(
                  color: TypeColors.fadedColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: width * 0.015,
              ),
              Text(
                statValue.toString(),
                style: TextStyle(
                  color: TypeColors.labelColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          ProgressBarGenerator(context, statName, statValue)
        ],
      ),
    );
  }

  Widget ProgressBarGenerator(
      BuildContext context, String statName, int statValue) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        alignment: Alignment.topCenter,
        margin:
            EdgeInsets.fromLTRB(0, height * 0.015, width * 0.04, height * 0.03),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: LinearProgressIndicator(
            value: statValue / 100,
            valueColor: AlwaysStoppedAnimation<Color>(
                statName.contains('Special')
                    ? TypeColors.specialStatColor
                    : TypeColors.statColor),
            backgroundColor: TypeColors.emptyStatColor,
          ),
        ));
  }
}
