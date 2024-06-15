import 'package:flutter/material.dart';
import 'package:sentidos_para_el_alma/scenes/home.dart';
import 'package:sentidos_para_el_alma/scenes/know_all.dart';
import 'package:intl/intl.dart';
import 'package:sentidos_para_el_alma/scenes/respuesta2.dart';

class ChooseDate extends StatefulWidget {
  const ChooseDate({super.key});

  @override
  _chooseDateState createState() => _chooseDateState();
}

class _chooseDateState extends State<ChooseDate> {
  final df = DateFormat('dd-MM-yyyy');

  //* Campo para ingresar nombre*/
  late TextEditingController controlador;
  String text = '';
  @override
  void initState() {
    super.initState();
    controlador = TextEditingController();
  }

  @override
  void dispose() {
    controlador.dispose();
    super.dispose();
  }

  //*Formulario para ingresar fecha */
  DateTime _fecha = DateTime.now();
  String year = '';
  String month = '';
  String day = '';

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        _fecha = value!;
        year = getYear(_fecha);
        month = getMonth(_fecha);
        day = getDay(_fecha);
      });
    });
  }

  //*Signo
  String signo = '';

  @override
  Widget build(BuildContext context) {
    String urlFinal = setFinalUrl(signo, year, month, day);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Consulta tu horoscopo'),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //* Campo para ingresar el signo
              Column(
                children: [
                  const Text(
                    'Selecciona tu signo',
                    style: TextStyle(fontSize: 25),
                  ),
                  DropdownMenu(
                      dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                        DropdownMenuEntry(value: 'aries', label: 'Aries'),
                        DropdownMenuEntry(value: 'taurus', label: 'Tauro'),
                        DropdownMenuEntry(value: 'gemini', label: 'Géminis'),
                        DropdownMenuEntry(value: 'cancer', label: 'Cáancer'),
                        DropdownMenuEntry(value: 'leo', label: 'Leo'),
                        DropdownMenuEntry(value: 'virgo', label: 'virgo'),
                        DropdownMenuEntry(value: 'libra', label: 'Libra'),
                        DropdownMenuEntry(value: 'scorpio', label: 'Escorpión'),
                        DropdownMenuEntry(
                            value: 'sagittarius', label: 'Sagitario'),
                        DropdownMenuEntry(
                            value: 'capricorn', label: 'Capricornio'),
                        DropdownMenuEntry(value: 'aquarius', label: 'Acuario'),
                        DropdownMenuEntry(value: 'pisces', label: 'Piscis'),
                      ],
                      onSelected: (value) {
                        setState(() {
                          signo = value!;
                        });
                      }),
                ],
              ),
              // //* Campo para ingresar nombre

              // const Text(
              //   'Ingresa tu nombre',
              //   style: TextStyle(fontSize: 25),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(25),
              //   child: TextField(
              //       controller: controlador,
              //       decoration: const InputDecoration(
              //           border: OutlineInputBorder(), labelText: 'Nombre'),
              //       onChanged: (String value) {
              //         setState(() {
              //           text = controlador.text;
              //         });
              //       }),
              // ),

              //* Campo para ingresar Fecha de nacimiento

              MaterialButton(
                onPressed: _showDatePicker,
                color: Colors.green,
                child: const Text(
                  'Selecciona la fecha',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),

              //*Boton enviar

              Column(children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Respuesta2(urlFinal)));
                    },
                    child: const Text('Enviar')),
              ]),
            ],
          ),
        ));
  }
}

//obtener datos de la fecha
String getYear(DateTime date) {
  int year = date.year;
  return year.toString();
}

String getMonth(DateTime date) {
  int month = date.month;
  if (month >= 10) {
    return month.toString();
  } else {
    return '0$month';
  }
}

String getDay(DateTime date) {
  int day = date.day;
  if (day >= 10) {
    return day.toString();
  } else {
    return '0$day';
  }
}

String setFinalUrl(String signo, String anio, String mes, String dia) {
  const String baseUrl =
      "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=";
  List<String> elementsUrl = [
    baseUrl,
    signo,
    '&day=',
    anio,
    '-',
    mes,
    '-',
    dia
  ];
  String finalUrl = elementsUrl.join();
  return finalUrl;
}
