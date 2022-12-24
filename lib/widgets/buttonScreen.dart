import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonScreen extends StatefulWidget {
  Function()? calculo;
  Function()? clean;

  ButtonScreen({this.calculo, this.clean});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.3,
          height: 48,
          child: ElevatedButton(
              style: ButtonStyle(
                  alignment: AlignmentDirectional.center,
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                widget.calculo?.call();
              },
              child: Text("Calcular")),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.3,
          height: 48,
          child: ElevatedButton(
              style: ButtonStyle(
                  alignment: AlignmentDirectional.center,
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {
                widget.clean?.call();
              },
              child: Text("Limpar")),
        ),
      ],
    );
  }
}
