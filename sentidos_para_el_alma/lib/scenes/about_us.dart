import 'package:flutter/material.dart';
import 'package:sentidos_para_el_alma/scenes/home.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About US'),
      ),
      body: Center(
        child: FilledButton(
          child: const Text('to home'),
          onPressed: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => const Home()));
          },
        ),
      ),
    );
  }
}
