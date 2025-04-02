import 'package:flutter/material.dart';
import 'package:mypcot/features/home/presentation/view/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(fontFamily: 'Roboto'),
      home: HomeScreen(),
    );
  }
}
