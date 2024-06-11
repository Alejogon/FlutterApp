import 'package:flutter/material.dart';
import 'package:sentidos_para_el_alma/scenes/home.dart';
import 'package:sentidos_para_el_alma/scenes/choose_date.dart';

class KnowAll extends StatelessWidget {
  const KnowAll({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conoce los signos'),
        backgroundColor: const Color.fromARGB(255, 182, 231, 183),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Center(
                child: Text(
                  'Sentidos para el alma',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              title: const Text('Sobre nosotros'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Home()));
              },
            ),
            ListTile(
              title: const Text('Calcula tu carta astral'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ChooseDate()));
              },
            ),
            ListTile(
              title: const Text('Conoce los signos'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const KnowAll()));
              },
            ),
          ],
        ),
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
