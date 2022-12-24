import 'package:enftech/states/insulinState.dart';
import 'package:enftech/widgets/EnftechTextField.dart';
import 'package:enftech/widgets/buttonScreen.dart';
import 'package:enftech/widgets/containerResult.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InsulinScreen extends StatefulWidget {
  @override
  State<InsulinScreen> createState() => _InsulinScreenState();
}

class _InsulinScreenState extends State<InsulinScreen> {
  final _controller_prescription = TextEditingController();
  final _controller_volume = TextEditingController();
  final _controller_available = TextEditingController();
  final _controller_syringe = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final state = context.watch<InsulinState>();
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
              'Insulina/Penicilina',
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
                          title: "Prescrição Médica (UI)",
                          onChanged: (value) {
                            state.prescription = double.parse(value);
                          },
                          controller: _controller_prescription),
                      EnftechTextField(
                          title: "Concentração Disponível (UI/mg)",
                          onChanged: (value) {
                            state.available = double.parse(value);
                          },
                          controller: _controller_available),
                      EnftechTextField(
                          title: "Volume da Concentração (ml)",
                          onChanged: (value) {
                            state.volume = double.parse(value);
                          },
                          controller: _controller_volume),
                      EnftechTextField(
                          title: "Concentração da Seringa (UI/ml)",
                          onChanged: (value) {
                            state.syringe = double.parse(value);
                          },
                          controller: _controller_syringe),
                      ButtonScreen(
                        calculo: () {
                          setState(() {
                            state.click = true;
                            state.medicamento = (state.prescription *
                                    state.volume /
                                    state.available) *
                                state.syringe;
                          });
                        },
                        clean: () {
                          _controller_available.clear();
                          _controller_prescription.clear();
                          _controller_volume.clear();
                          _controller_syringe.clear();
                          setState(() {
                            state.click = false;
                            state.volume = 0;
                            state.available = 0;
                            state.syringe = 0;
                            state.prescription = 0;
                          });
                        },
                      ),
                      if (state.click == true)
                        ContainerResult(
                          title: state.validade
                              ? "Aspire ${state.medicamento.toStringAsFixed(2)}ml de medicamento"
                              : "Número inválido",
                        ),
                    ]),
              ))),
    ));
  }
}
