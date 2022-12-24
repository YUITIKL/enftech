import 'package:enftech/states/dripState.dart';
import 'package:enftech/widgets/EnftechTextField.dart';
import 'package:enftech/widgets/buttonScreen.dart';
import 'package:enftech/widgets/containerResult.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DripScreen extends StatefulWidget {
  @override
  State<DripScreen> createState() => _DripScreenState();
}

class _DripScreenState extends State<DripScreen> {
  final _controller_volume = TextEditingController();
  final _controller_time = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final state = context.watch<DripState>();

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
                'Gotejamento',
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
                      title: "Volume Medicamento (ml)",
                      onChanged: (value) {
                        state.volume = double.parse(value);
                      },
                      controller: _controller_volume),
                  EnftechTextField(
                      title: "Tempo de aplicação (min)",
                      onChanged: (value) {
                        state.time = double.parse(value);
                      },
                      controller: _controller_time),
                  ButtonScreen(
                    calculo: () {
                      setState(() {
                        state.click = true;
                        state.microgodas = state.volume / (state.time / 60);
                        state.macrogotas =
                            state.volume / ((state.time / 60) * 3);
                      });
                    },
                    clean: () {
                      _controller_volume.clear();
                      _controller_time.clear();
                      setState(() {
                        state.click = false;
                        state.volume = 0;
                        state.time = 0;
                      });
                    },
                  ),
                  if (state.click == true)
                    ContainerResult(
                      title: state.validade
                          ? "${state.microgodas.toStringAsFixed(2)} Microgotas por minuto "
                          : "Número inválido",
                    ),
                  if (state.click == true)
                    ContainerResult(
                      title: state.validade
                          ? "${state.macrogotas.toStringAsFixed(2)} Macrogotas por minuto "
                          : "Número inválido",
                    )
                ],
              ),
            )),
      ),
    );
  }
}
