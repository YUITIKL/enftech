import 'package:enftech/states/ruleState.dart';
import 'package:enftech/widgets/EnftechTextField.dart';
import 'package:enftech/widgets/buttonScreen.dart';
import 'package:enftech/widgets/containerResult.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RuleScreen extends StatefulWidget {
  @override
  State<RuleScreen> createState() => _RuleScreenState();
}

class _RuleScreenState extends State<RuleScreen> {
  final _controller_prescription = TextEditingController();
  final _controller_volume = TextEditingController();
  final _controller_disponivel = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final state = context.watch<RuleState>();
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
                  'Regra de 3',
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
                          title: "Prescrição",
                          onChanged: (value) {
                            state.prescription = double.parse(value);
                          },
                          controller: _controller_prescription),
                      EnftechTextField(
                          title: "Volume Disponível",
                          onChanged: (value) {
                            state.volume = double.parse(value);
                          },
                          controller: _controller_volume),
                      EnftechTextField(
                          title: "Disponivel",
                          onChanged: (value) {
                            state.disponivel = double.parse(value);
                          },
                          controller: _controller_disponivel),
                      ButtonScreen(
                        calculo: () {
                          setState(() {
                            state.click = true;
                            state.total = state.prescription *
                                state.volume /
                                state.disponivel;
                          });
                        },
                        clean: () {
                          _controller_disponivel.clear();
                          _controller_prescription.clear();
                          _controller_volume.clear();
                          setState(() {
                            state.click = false;
                            state.volume = 0;
                            state.total = 0;
                            state.prescription = 0;
                          });
                        },
                      ),
                      if (state.click == true)
                        ContainerResult(
                          title: state.validade
                              ? "Resultado: ${state.total.toStringAsFixed(2)}"
                              : "Número inválido",
                        ),
                    ]),
              ))),
    );
  }
}
