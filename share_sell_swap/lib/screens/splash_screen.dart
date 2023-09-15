import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.white,
      Colors.cyan,
      Colors.black,

      // Colors.yellow,
      // Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 40.0,
      fontFamily: 'RobotoSlab',
    );

    return Scaffold(
      backgroundColor: Colors.cyan.shade900,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/cart6.png',
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'ShareSellSwap',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                ),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            ),
          ],
        ),
      ),
    );
  }
}
