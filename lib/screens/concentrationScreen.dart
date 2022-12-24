import 'package:enftech/states/concentrationState.dart';
import 'package:enftech/widgets/EnftechTextField.dart';
import 'package:enftech/widgets/buttonScreen.dart';
import 'package:enftech/widgets/containerResult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ConcentrationScreen extends StatefulWidget {
  @override
  State<ConcentrationScreen> createState() => _ConcentrationScreenState();
}

class _ConcentrationScreenState extends State<ConcentrationScreen> {
  final _controller_prescription = TextEditingController();
  final _controller_concentration = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ConcentrationState>();

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
                  'Concentração gotas/comprimentos',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                titleSpacing: 0,
                centerTitle: false,
                backgroundColor: Colors.green,
                elevation: 0,
              ),
              body: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EnftechTextField(
                        title: "Prescrição Medicamento (ml)",
                        onChanged: (value) {
                          state.prescription = double.parse(value);
                        },
                        controller: _controller_prescription),
                    EnftechTextField(
                        title: "Tempo de aplicação (min)",
                        onChanged: (value) {
                          state.concentration = double.parse(value);
                        },
                        controller: _controller_concentration),
                    ButtonScreen(
                      calculo: () {
                        setState(() {
                          state.click = true;
                          state.total =
                              state.prescription / state.concentration;
                        });
                      },
                      clean: () {
                        _controller_prescription.clear();
                        _controller_concentration.clear();
                        setState(() {
                          state.click = false;
                          state.prescription = 0;
                          state.concentration = 0;
                        });
                      },
                    ),
                    if (state.click == true)
                      ContainerResult(
                        title: state.validade
                            ? " Administre ${state.total.toStringAsFixed(2)} comprimidos "
                            : "Número inválido",
                      ),
                  ],
                ),
              ))),
    );
  }
}
