import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listview - JSON',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Listview - JSON'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data = [];

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/juegos.json');
    setState(() {
      data = json.decode(jsonText);
    });
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          var nombre = data[index]['Nombre'];
          var imagen = data[index]['Imagen'];
          var precio = data[index]['Precio'];
          var descri = data[index]['Descripcion'];
          return Column(
            children: <Widget>[
              ListTile(
                leading: Image.network(
                  imagen,
                ),
                title: Text(nombre),
                subtitle: Text(precio),
              ),
            ],
          );
        },
      ),
    );
  }
}
