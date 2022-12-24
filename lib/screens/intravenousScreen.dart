import 'package:enftech/states/intravenousState.dart';
import 'package:enftech/widgets/EnftechTextField.dart';
import 'package:enftech/widgets/buttonScreen.dart';
import 'package:enftech/widgets/containerResult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class IntravenousScreen extends StatefulWidget {
  @override
  State<IntravenousScreen> createState() => _IntravenousScreenState();
}

class _IntravenousScreenState extends State<IntravenousScreen> {
  final _controller_prescription = TextEditingController();
  final _controller_volume = TextEditingController();
  final _controller_available = TextEditingController();
  final _controller_total = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final state = context.watch<IntravenousState>();
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
              'Medicação endovenosa',
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
                          title: "Volume Disponível (ml)",
                          onChanged: (value) {
                            state.volume = double.parse(value);
                          },
                          controller: _controller_volume),
                      EnftechTextField(
                          title: "Concentração Disponível por ml (mg)",
                          onChanged: (value) {
                            state.available = double.parse(value);
                          },
                          controller: _controller_available),
                      EnftechTextField(
                          title: "Concentração Total Disponível (mg)",
                          onChanged: (value) {
                            state.total = double.parse(value);
                          },
                          controller: _controller_total),
                      ButtonScreen(
                        calculo: () {
                          setState(() {
                            state.click = true;
                            state.medicamento =
                                state.prescription * state.volume / state.total;
                          });
                        },
                        clean: () {
                          _controller_available.clear();
                          _controller_prescription.clear();
                          _controller_volume.clear();
                          _controller_total.clear();
                          setState(() {
                            state.click = false;
                            state.volume = 0;
                            state.available = 0;
                            state.total = 0;
                            state.prescription = 0;
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
