import 'package:enftech/states/babyState.dart';
import 'package:enftech/widgets/EnftechTextField.dart';
import 'package:enftech/widgets/buttonScreen.dart';
import 'package:enftech/widgets/containerResult.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BabyScreen extends StatefulWidget {
  @override
  State<BabyScreen> createState() => _BabyScreenState();
}

class _BabyScreenState extends State<BabyScreen> {
  final _controller_concentration = TextEditingController();
  final _controller_volume = TextEditingController();
  final _controller_dose = TextEditingController();
  final _controller_peso = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final state = context.watch<BabyState>();
    return Container(
        child: SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                state.click = false;
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Medicação por peso',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            titleSpacing: 0,
            centerTitle: false,
            backgroundColor: Colors.green,
            elevation: 0,
          ),
          body: Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EnftechTextField(
                          title: "Concentração Disponível (mg)",
                          onChanged: (value) {
                            state.concentration = double.parse(value);
                          },
                          controller: _controller_concentration),
                      EnftechTextField(
                          title: "Volume da Concentração (ml)",
                          onChanged: (value) {
                            state.volume = double.parse(value);
                          },
                          controller: _controller_volume),
                      EnftechTextField(
                          title: "Dose Diária Indicada por Kilo (mg)",
                          onChanged: (value) {
                            state.dose = double.parse(value);
                          },
                          controller: _controller_dose),
                      EnftechTextField(
                          title: "Peso Paciente (kg)",
                          onChanged: (value) {
                            state.peso = double.parse(value);
                          },
                          controller: _controller_peso),
                      ButtonScreen(
                        calculo: () {
                          setState(() {
                            state.click = true;
                            state.medicamento = state.dose *
                                state.volume *
                                state.peso /
                                state.concentration;
                          });
                        },
                        clean: () {
                          _controller_dose.clear();
                          _controller_concentration.clear();
                          _controller_volume.clear();
                          _controller_peso.clear();
                          setState(() {
                            state.click = false;
                            state.volume = 0;
                            state.dose = 0;
                            state.peso = 0;
                            state.concentration = 0;
                          });
                        },
                      ),
                      if (state.click == true)
                        ContainerResult(
                          title: state.validade
                              ? "Administre ${state.medicamento.toStringAsFixed(2)}ml de medicamento"
                              : "Número inválido",
                        ),
                    ]),
              ))),
    ));
  }
}
