import 'package:flutter/material.dart';

import 'pages/constants/constants.dart';
import 'pages/principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CardioApp',
      theme: ThemeData(
        primaryColor: kprimaryColor,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
