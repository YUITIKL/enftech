import 'package:enftech/states/serumState.dart';
import 'package:enftech/widgets/EnftechTextField.dart';
import 'package:enftech/widgets/buttonScreen.dart';
import 'package:enftech/widgets/containerResult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class SerumScreen extends StatefulWidget {
  @override
  State<SerumScreen> createState() => _SerumScreenState();
}

class _SerumScreenState extends State<SerumScreen> {
  final _controller_prescription = TextEditingController();
  final _controller_volume_prescription = TextEditingController();
  final _controller_percentage_available = TextEditingController();
  final _controller_volume_available = TextEditingController();
  final _controller_percentage_ampoule = TextEditingController();
  final _controller_volume_ampoule = TextEditingController();
  late double desprezivel;
  @override
  Widget build(BuildContext context) {
    final state = context.watch<SerumState>();
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
              'Transformação de soro',
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
                          title: "Prescrição Médica (%)",
                          onChanged: (value) {
                            state.prescription = double.parse(value);
                          },
                          controller: _controller_prescription),
                      EnftechTextField(
                          title: "Volume da Prescrição (ml)",
                          onChanged: (value) {
                            state.volume_prescription = double.parse(value);
                          },
                          controller: _controller_volume_prescription),
                      EnftechTextField(
                          title: "Porcentagem Disponível (%)",
                          onChanged: (value) {
                            state.percentage_available = double.parse(value);
                          },
                          controller: _controller_percentage_available),
                      EnftechTextField(
                          title: "Volume Disponível (ml)",
                          onChanged: (value) {
                            state.volume_available = double.parse(value);
                          },
                          controller: _controller_volume_available),
                      EnftechTextField(
                          title: "Porcentagem Ampola (%)",
                          onChanged: (value) {
                            state.percentage_ampoule = double.parse(value);
                          },
                          controller: _controller_percentage_ampoule),
                      EnftechTextField(
                          title: "Volume Ampola (ml)",
                          onChanged: (value) {
                            state.volume_ampoule = double.parse(value);
                          },
                          controller: _controller_volume_ampoule),
                      ButtonScreen(
                        calculo: () {
                          setState(() {
                            state.click = true;
                            state.serum_available = state.percentage_available *
                                state.volume_prescription /
                                100;
                            state.serum_concentration = state.prescription *
                                state.volume_prescription /
                                100;
                            state.lack = state.serum_concentration -
                                state.serum_available;
                            state.amout_ampoule = state.percentage_ampoule *
                                state.volume_ampoule /
                                100;
                            state.add_serum =
                                state.lack * 100 / state.amout_ampoule * 0.1;
                            desprezivel = state.percentage_available *
                                state.add_serum /
                                100;
                            state.total =
                                desprezivel * 100 / state.percentage_ampoule;
                          });
                        },
                        clean: () {
                          _controller_prescription.clear();
                          _controller_volume_prescription.clear();
                          _controller_percentage_available.clear();
                          _controller_volume_available.clear();
                          _controller_percentage_ampoule.clear();
                          _controller_volume_ampoule.clear();
                          setState(() {
                            state.click = false;
                            state.prescription = 0;
                            state.volume_ampoule = 0;
                            state.volume_available = 0;
                            state.volume_prescription = 0;
                            state.percentage_available = 0;
                            state.percentage_ampoule = 0;
                          });
                        },
                      ),
                      if (state.click == true)
                        ContainerResult(
                          title: state.validade
                              ? "Despreze ${state.add_serum.toStringAsFixed(2)} ml da solução disponível"
                              : "Número inválido",
                        ),
                      if (state.click == true)
                        ContainerResult(
                          title: state.validade
                              ? "Acrescente ${state.total.toStringAsFixed(2)} ampolas na solução"
                              : "Número inválido",
                        ),
                      if (state.click == true)
                        ContainerResult(
                          title: state.validade
                              ? "A prescrição contém ${state.serum_concentration.toStringAsFixed(2)} gramas de soluto"
                              : "Número inválido",
                        ),
                      if (state.click == true)
                        ContainerResult(
                          title: state.validade
                              ? "A solução disponível contém ${state.serum_available.toStringAsFixed(2)} gramas"
                              : "Número inválido",
                        ),
                      if (state.click == true)
                        ContainerResult(
                          title: state.validade
                              ? "Faltam na solução disponível ${state.lack.toStringAsFixed(2)} gramas"
                              : "Número inválido",
                        ),
                      if (state.click == true)
                        ContainerResult(
                          title: state.validade
                              ? "Cada ampola contém ${state.amout_ampoule.toStringAsFixed(2)} de soluto"
                              : "Número inválido",
                        ),
                    ]),
              ))),
    ));
  }
}
