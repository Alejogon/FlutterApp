import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:sentidos_para_el_alma/scenes/config/infrastructure/models/horoscopo.dart';

class Respuesta2 extends StatefulWidget {
  final String url;
  const Respuesta2(this.url, {super.key});

  @override
  State<Respuesta2> createState() => _Respuesta2State();
}

class _Respuesta2State extends State<Respuesta2> {
  Horoscopo? _horoscopo;
  Future<void> getHoroscopo() async {
    final response = await Dio().get(widget.url);
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
        title: const Text('Tu horoscopo'),
        backgroundColor: const Color.fromARGB(255, 182, 231, 183),
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
          Text(widget.url),
        ]),
      ),
    );
  }
}

void getHTTP(String url, Set<String> set) async {
  print(url);
  try {
    var response = await Dio().get(url);

    print(response);
  } catch (e) {
    print(e);
  }
}

Future<Horoscopo> getHoroscopo(String url) async {
  print(url);
  Horoscopo horoscopo;
  var response = await Dio().get(url);
  print(response);
  horoscopo = Horoscopo.fromJson(response.data);

  return horoscopo;
}
