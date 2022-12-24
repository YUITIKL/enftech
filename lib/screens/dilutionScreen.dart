import 'package:enftech/states/dilutionState.dart';
import 'package:enftech/widgets/EnftechTextField.dart';
import 'package:enftech/widgets/buttonScreen.dart';
import 'package:enftech/widgets/containerResult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class DilutionScreen extends StatefulWidget {
  @override
  State<DilutionScreen> createState() => _DilutionScreenState();
}

class _DilutionScreenState extends State<DilutionScreen> {
  final _controller_prescription = TextEditingController();
  final _controller_concentration = TextEditingController();
  final _controller_volume = TextEditingController();
  final _controller_solvent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final state = context.watch<DilutionState>();
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
              'Diluição de medicamento',
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
                          title: "Prescrição Médica (mg)",
                          onChanged: (value) {
                            state.prescription = double.parse(value);
                          },
                          controller: _controller_prescription),
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
                          title: "Volume do Solvente (ml)",
                          onChanged: (value) {
                            state.solvent = double.parse(value);
                          },
                          controller: _controller_solvent),
                      ButtonScreen(
                        calculo: () {
                          setState(() {
                            state.click = true;
                            state.medicamento0 = state.concentration *
                                state.prescription *
                                state.volume /
                                state.solvent;
                            state.medicamento1 =
                                state.prescription / state.medicamento0;
                          });
                        },
                        clean: () {
                          _controller_concentration.clear();
                          _controller_prescription.clear();
                          _controller_volume.clear();
                          _controller_solvent.clear();
                          setState(() {
                            state.click = false;
                            state.volume = 0;
                            state.concentration = 0;
                            state.solvent = 0;
                            state.prescription = 0;
                          });
                        },
                      ),
                      if (state.click == true)
                        ContainerResult(
                          title: state.validade
                              ? "Cada ml contém ${state.medicamento0.toStringAsFixed(2)}mg de medicamento"
                              : "Número inválido",
                        ),
                      if (state.click == true)
                        ContainerResult(
                          title: state.validade
                              ? "Aspire ${state.medicamento1.toStringAsFixed(2)}ml de medicamento"
                              : "Número inválido",
                        ),
                    ]),
              ))),
    ));
  }
}
