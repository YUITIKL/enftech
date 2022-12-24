import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContainerResult extends StatefulWidget {
  String? title;

  ContainerResult({this.title});

  @override
  State<ContainerResult> createState() => _ContainerResultState();
}

class _ContainerResultState extends State<ContainerResult> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.purple[600],
              borderRadius: BorderRadius.circular(5.0)),
          height: 48,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(top: 13),
            child: Text(
              widget.title ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          )),
    );
  }
}
