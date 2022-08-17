import 'package:flutter/material.dart';

abstract class Appcolor {
  static Color backgroundColor = const Color.fromARGB(255, 118, 214, 121);
  static Color logoColor = const Color.fromARGB(255, 242, 114, 105);
  static Color registerColor = const Color.fromARGB(255, 121, 192, 249);
}

const Map<int, Color> _swatchOpacity = {
  50: Color.fromRGBO(139, 195, 74, .1),
  100: Color.fromRGBO(139, 195, 74, .2),
  200: Color.fromRGBO(139, 195, 74, .3),
  300: Color.fromRGBO(139, 195, 74, .4),
  400: Color.fromRGBO(139, 195, 74, .5),
  500: Color.fromRGBO(139, 195, 74, .6),
  600: Color.fromRGBO(139, 195, 74, .7),
  700: Color.fromRGBO(139, 195, 74, .8),
  800: Color.fromRGBO(139, 195, 74, .9),
  900: Color.fromRGBO(139, 195, 74, .1),
};

abstract class Customcolor {
  static MaterialColor customswatchColor =
      const MaterialColor(0xFF8BC34A, _swatchOpacity);
}
