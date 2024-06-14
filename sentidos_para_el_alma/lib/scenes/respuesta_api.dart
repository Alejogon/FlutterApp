import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:sentidos_para_el_alma/scenes/config/infrastructure/models/horoscopo.dart';
import 'package:sentidos_para_el_alma/scenes/home.dart';
import 'package:sentidos_para_el_alma/scenes/choose_date.dart';
import 'package:sentidos_para_el_alma/scenes/know_all.dart';

class RespuestaApi extends StatefulWidget {
  final String year;
  final String month;
  final String day;
  const RespuestaApi(this.year, this.month, this.day, {super.key});

  @override
  State<RespuestaApi> createState() => _RespuestaApiState();
}

class _RespuestaApiState extends State<RespuestaApi> {
  String urlBase =
      'https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=gemini&day=';
  String url =
      'https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=gemini&day=2024-06-14';
  Horoscopo? _horoscopo;

  Future<void> getHoroscopo() async {
    final response = await Dio().get(url);
    _horoscopo = Horoscopo.fromJson(response.data);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getHoroscopo();
  }

  @override
  Widget build(BuildContext context) {
    String anio = widget.year.toString();
    String mes = widget.month.toString();
    String dia = widget.day.toString();
    List<String> elementosUrl = [urlBase, anio, mes, dia];
    String urlFinal = elementosUrl.join("-");
    setState(() {
      url = urlFinal;
    });

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
          const Text('Respuesta Api '),
          Text('$anio-${widget.month}-${widget.day}'),
          Text(url),
        ]),
      ),
    );
  }
}
