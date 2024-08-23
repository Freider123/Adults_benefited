import 'package:consulta_adulto_mayor/article_injetion.dart';
import 'package:consulta_adulto_mayor/presentacion/modules/pages/home/home.dart';
import 'package:flutter/material.dart';

void main() async {
  initArticlesInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
