import 'package:enftech/states/babyState.dart';
import 'package:enftech/states/concentrationState.dart';
import 'package:enftech/states/dilutionState.dart';
import 'package:enftech/states/dripState.dart';
import 'package:enftech/states/insulinState.dart';
import 'package:enftech/states/intravenousState.dart';
import 'package:enftech/states/ruleState.dart';
import 'package:enftech/states/serumState.dart';
import 'package:enftech/widgets/buttonMain.dart';
import 'package:enftech/screens/concentrationScreen.dart';
import 'package:enftech/screens/dilutionScreen.dart';
import 'package:enftech/screens/dripScreen.dart';
import 'package:enftech/screens/insulinScreen.dart';
import 'package:enftech/screens/intravenousScreen.dart';
import 'package:enftech/screens/babyScreen.dart';
import 'package:enftech/screens/ruleScreen.dart';
import 'package:enftech/screens/serumScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        MultiProvider(
          providers: [
            ChangeNotifierProvider<DripState>(
              create: (_) => DripState(),
            ),
            ChangeNotifierProvider<IntravenousState>(
              create: (_) => IntravenousState(),
            ),
            ChangeNotifierProvider<InsulinState>(
              create: (_) => InsulinState(),
            ),
            ChangeNotifierProvider<ConcentrationState>(
              create: (_) => ConcentrationState(),
            ),
            ChangeNotifierProvider<DilutionState>(
              create: (_) => DilutionState(),
            ),
            ChangeNotifierProvider<BabyState>(
              create: (_) => BabyState(),
            ),
            ChangeNotifierProvider<RuleState>(
              create: (_) => RuleState(),
            ),
            ChangeNotifierProvider<SerumState>(
              create: (_) => SerumState(),
            ),
          ],
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Enfertech',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Enfertech'),
      ),
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
            appBar: AppBar(
              title: Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Enftech',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
              titleSpacing: 0,
              centerTitle: false,
              backgroundColor: Colors.green,
              elevation: 0,
            ),
            body: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ButtonMain(
                          "Gotejamento", "images/drops.png", DripScreen()),
                      ButtonMain("Medicação endovenosa", "images/injection.png",
                          IntravenousScreen()),
                      ButtonMain("Transformação de soro", "images/serum.png",
                          SerumScreen()),
                      ButtonMain("Insulina/Penicilina", "images/remedy.png",
                          InsulinScreen()),
                      ButtonMain("Regra de 3", "images/rule.png", RuleScreen()),
                      ButtonMain("Concentração gotas/comprimentos",
                          "images/scale.png", ConcentrationScreen()),
                      ButtonMain("Medicação por peso (Pediatria)",
                          "images/baby.png", BabyScreen()),
                      ButtonMain("Diluição de medicamento",
                          "images/chemistry.png", DilutionScreen()),
                    ],
                  ),
                ),
              ),
            )));
  }
}
