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

  Future<void> getHoroscopo() async {
    //https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=gemini&day=2024-05-03
    final response = await Dio().get(
        'https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=gemini&day=2024-05-03');
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
        body: SingleChildScrollView(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//*Aries---------------------------------------------------------------------------
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                      "https://img.icons8.com/?size=100&id=2418&format=png&color=000000")),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'ARIES',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha inicio: 21 de marzo',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha fin: 19 de abril',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Palabra: Acción',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Origen: Mitología griega, basado en el carnero con el vellocino de oro.',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Generalidad: Los arianos son conocidos por su energía, valentía e iniciativa. Son líderes naturales y pioneros.',
                    style: TextStyle(fontSize: 20),
                  )),
              const Divider(),
//*Tauro---------------------------------------------------------------------------
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                      "https://img.icons8.com/?size=100&id=2708&format=png&color=000000")),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'TAURO',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha inicio: 20 de abril',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha fin: 20 de mayo',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Palabra: Estabilidad',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Origen: Mitología griega, basado en el toro blanco en que se transformó Zeus.',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Generalidad: Los taurinos son conocidos por su practicidad, fiabilidad y amor por la comodidad.',
                    style: TextStyle(fontSize: 20),
                  )),
              const Divider(),
//*Geminis---------------------------------------------------------------------------
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                      "https://img.icons8.com/?size=100&id=2640&format=png&color=000000")),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'GEMINIS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha inicio: 21 de mayo',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha fin: 20 de junio',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Palabra: Comunicación',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Origen: Mitología griega, basado en los gemelos Cástor y Pólux..',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Generalidad: Los geminianos son conocidos por su versatilidad, inteligencia y habilidad para comunicarse.',
                    style: TextStyle(fontSize: 20),
                  )),
              const Divider(),
//*CANCER---------------------------------------------------------------------------
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                      "https://img.icons8.com/?size=100&id=2387&format=png&color=000000")),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'CANCER',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha inicio: 21 de junio',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha fin: 22 de julio',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Palabra: Emoción',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Origen: Mitología griega, basado en el cangrejo enviado por Hera para atacar a Hércules.',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Generalidad: Los cancerianos son conocidos por su sensibilidad, intuición y amor por la familia.',
                    style: TextStyle(fontSize: 20),
                  )),
              const Divider(),
//*LEO---------------------------------------------------------------------------
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                      "https://img.icons8.com/?size=100&id=2710&format=png&color=000000")),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'LEO',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha inicio: 23 de julio',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha fin: 22 de agosto',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Palabra: Orgullo',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Origen: Mitología griega, basado en el león de Nemea derrotado por Hércules.',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Generalidad: Los leoninos son conocidos por su naturaleza dominante, creativa y dramática. Son líderes naturales que aman el protagonismo y tienen una gran confianza en sí mismos.',
                    style: TextStyle(fontSize: 20),
                  )),
              const Divider(),
//*VIRGO---------------------------------------------------------------------------
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                      "https://img.icons8.com/?size=100&id=2499&format=png&color=000000")),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'VIRGO',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha inicio: 23 de agosto',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha fin: 22 de septiembre',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Palabra: Perfección',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Origen: Mitología griega, basado en la diosa Astrea, que representa la pureza.',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Generalidad: Los virginianos son conocidos por su atención al detalle, practicidad y amor por el orden.',
                    style: TextStyle(fontSize: 20),
                  )),
              const Divider(),
//*LIBRA---------------------------------------------------------------------------
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                      "https://img.icons8.com/?size=100&id=2565&format=png&color=000000")),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'LIBRA',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha inicio: 23 de septiembre',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha fin: 22 de octubre',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Palabra: Equilibrio',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Origen: Mitología griega, basado en la diosa Temis, quien portaba la balanza de la justicia.',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Generalidad: Los librianos son conocidos por su sentido de la justicia, la diplomacia y el amor por la belleza.',
                    style: TextStyle(fontSize: 20),
                  )),
              const Divider(),
//*ESCORPIO---------------------------------------------------------------------------
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                      "https://img.icons8.com/?size=100&id=2565&format=png&color=000000")),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'ESCORPIO',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha inicio: 23 de octubre',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Fecha fin: 21 de Noviembre',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Palabra: Intensidad',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Origen: Mitología griega, basado en el escorpión enviado por Artemisa para matar a Orión.',
                    style: TextStyle(fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Generalidad: Los escorpianos son conocidos por su intensidad emocional, determinación y misterio.',
                    style: TextStyle(fontSize: 20),
                  )),
              const Divider(),
            ]),
          ),
        ));
  }
}
