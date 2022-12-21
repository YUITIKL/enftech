import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DripScreen extends StatefulWidget {
  @override
  State<DripScreen> createState() => _DripScreenState();
}

class _DripScreenState extends State<DripScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.maybePop(context);
            },
          ),
          title: Text(
            "Gotejamento",
            style: TextStyle(color: Colors.white),
          ),
        ),
      )),
    );
  }
}
