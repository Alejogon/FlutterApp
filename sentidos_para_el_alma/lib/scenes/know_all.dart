import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:sentidos_para_el_alma/scenes/config/infrastructure/models/horoscopo.dart';
import 'package:sentidos_para_el_alma/scenes/home.dart';
import 'package:sentidos_para_el_alma/scenes/choose_date.dart';

class KnowAll extends StatefulWidget {
  const KnowAll({super.key});

  @override
  State<KnowAll> createState() => _KnowAllState();
}

class _KnowAllState extends State<KnowAll> {
  Horoscopo? _horoscopo;

  @override
  void initState() {
    super.initState();
    getHoroscopo();
  }

  Future<void> getHoroscopo() async {
    //https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=gemini&day=2024-05-03
    final response = await Dio().get(
        'https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=gemini&day=2024-05-03');
    _horoscopo = Horoscopo.fromJson(response.data);
    setState(() {});
  }

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
              title: const Text('Calcula tu carta astral'),
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
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: const EdgeInsets.all(25),
              child: Text(
                _horoscopo?.data.date ?? 'No data',
                style: const TextStyle(fontSize: 30),
              )),
          Padding(
              padding: const EdgeInsets.all(25),
              child: Text(_horoscopo?.data.horoscopeData ?? 'No data')),
        ]),
      ),
    );
  }
}
