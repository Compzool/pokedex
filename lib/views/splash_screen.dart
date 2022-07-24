import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/views/home_screen.dart';
import 'package:pokedex/widgets/constants.dart';
import 'package:pokedex/widgets/hex_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    changeScreen();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: height * 0.2,
                  width: width * 0.2,
                  child: Lottie.network(
                      'https://assets5.lottiefiles.com/packages/lf20_iwmd6pyr.json')),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "POKEMON",
                    style: TextStyle(
                        letterSpacing: 4.8,
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Pokedex",
                    style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  changeScreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      ;
    });
  }
}
