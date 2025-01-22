import 'package:nasa_app/views/home_page.dart';
import 'package:flutter/material.dart';

const nasaRed = Color.fromRGBO(255, 64, 64, 1.0);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'NASA Photos',
        darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: ColorScheme.dark(
              surface: Color.fromRGBO(15, 15, 15, 1.0),
              outline: Color.fromRGBO(196, 196, 196, 1),
              secondary: nasaRed,
              primary: nasaRed,
            )),
        themeMode: ThemeMode.dark,
        home: HomePage());
  }
}
