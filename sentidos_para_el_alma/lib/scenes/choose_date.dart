import 'package:flutter/material.dart';
import 'package:sentidos_para_el_alma/scenes/home.dart';
import 'package:sentidos_para_el_alma/scenes/know_all.dart';
import 'package:intl/intl.dart';
import 'package:sentidos_para_el_alma/scenes/respuesta2.dart';
import 'package:sentidos_para_el_alma/scenes/respuesta_api.dart';

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

  //*Formulario para ingresar fecha de nacimiento*/
  DateTime _fecha = DateTime.now();
  String year = '';
  String month = '';
  String day = '';

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1924),
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

  //*Hora de nacimiento
  String hora = '00';

  Widget build(BuildContext context) {
    String urlFinal = setFinalUrl(year, month, day);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calcula tu carta astral'),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //* Campo para ingresar nombre

              const Text(
                'Ingresa tu nombre',
                style: TextStyle(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: TextField(
                    controller: controlador,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Nombre'),
                    onChanged: (String value) {
                      setState(() {
                        text = controlador.text;
                      });
                    }),
              ),

              //* Campo para ingresar Fecha de nacimiento

              MaterialButton(
                onPressed: _showDatePicker,
                color: Colors.green,
                child: const Text(
                  'Selecciona tu fecha de nacimiento',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              //* Campo para ingresar la hora de nacimiento
              Column(
                children: [
                  const Text(
                    'Selecciona la hora en que naciste',
                    style: TextStyle(fontSize: 25),
                  ),
                  DropdownMenu(
                      dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                        DropdownMenuEntry(value: '00', label: '12 am'),
                        DropdownMenuEntry(value: '02', label: '2 am'),
                        DropdownMenuEntry(value: '04', label: '4 am'),
                        DropdownMenuEntry(value: '06', label: '6 am'),
                        DropdownMenuEntry(value: '08', label: '8 am'),
                        DropdownMenuEntry(value: '10', label: '10 am'),
                        DropdownMenuEntry(value: '12', label: '12 m'),
                        DropdownMenuEntry(value: '14', label: '2 pm'),
                        DropdownMenuEntry(value: '16', label: '4 pm'),
                        DropdownMenuEntry(value: '18', label: '6 pm'),
                        DropdownMenuEntry(value: '20', label: '8 pm'),
                        DropdownMenuEntry(value: '22', label: '10 pm'),
                      ],
                      onSelected: (value) {
                        setState(() {
                          hora = value!;
                        });
                      }),
                ],
              ),

              //*Imprime los valores registrador por el usuario

              Column(children: [
                Text('Nombre: $text'),
                Text('Fecha seleccionada: $year - $month - $day'),
                Text('Hora seleccionada: $hora'),
                Text('urlFinal: $urlFinal'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Respuesta2(urlFinal)));
                    },
                    child: const Text('Enviar')),
              ]),

              //Text('$selectedDate')
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

String setFinalUrl(String anio, String mes, String dia) {
  const String baseUrl =
      "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=gemini&day=";
  List<String> elementsUrl = [baseUrl, anio, '-', mes, '-', dia];
  String finalUrl = elementsUrl.join();
  return finalUrl;
}
