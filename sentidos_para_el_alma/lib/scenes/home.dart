import 'package:flutter/material.dart';
import 'package:sentidos_para_el_alma/scenes/choose_date.dart';
import 'package:sentidos_para_el_alma/scenes/know_all.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sentidos para el alma',
          style: TextStyle(),
        ),
        backgroundColor: const Color.fromARGB(255, 182, 231, 183),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  'Sentidos para el alma',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
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
              title: const Text('Consulta tu horoscopo'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChooseDate()));
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
      body: Column(children: [
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(top: 50, bottom: 20),
          child: Image.network(
              "https://cdn.iconscout.com/icon/premium/png-256-thumb/zodiac-signs-1446948-1222581.png?f=webp"),
        ),
        Container(
          padding: const EdgeInsets.all(40),
          child: const Text(
            "La TERAPIA ENERGÉTICA, se basa en el principio de que todo cuanto es, es consciencia o energía en diversas manifestaciones. Considera al ser humano como una unidad de conciencia en evolución, producto de la integración de diferentes campos de energía o niveles: físico, emocional, mental y espiritual y concibe la enfermedad como una consecuencia de la fricción entre estos niveles de consciencia. Eliminar estas fricciones, permitiendo el libre flujo de la energía en el sistema, es uno de los propósitos de la Bioenergética.",
            style: TextStyle(fontSize: 20),
          ),
        )
      ]),
    );
  }
}
