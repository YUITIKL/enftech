import 'package:enftech/buttonMain.dart';
import 'package:enftech/buttonMenu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enfertech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Enfertech'),
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
          'Enftech',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        titleSpacing: 0,
        centerTitle: false,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: <Widget>[
              ButtonMain("Gotejamento", "images/drops.png"),
              ButtonMain("Medicação endovenosa", "images/injection.png"),
              ButtonMain("Transformação de soro", "images/serum.png"),
              ButtonMain("Insulina/Penicilina", "images/remedy.png"),
              ButtonMain("Regra de 3", "images/rule.png"),
              ButtonMain("Concentração gotas/comprimentos", "images/scale.png"),
              ButtonMain("pergnato de potássio", "images/pipe.png"),
              ButtonMain("Diluição de medicamento", "images/chemistry.png"),
            ],
          ),
        ),
      ),
    ));
  }
}
