import 'package:flutter/material.dart';
import 'package:sentidos_para_el_alma/scenes/home.dart';
import 'package:sentidos_para_el_alma/app_theme.dart';
//import 'package:sentidos_para_el_alma/scenes/know_all.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
    );
  }
}
