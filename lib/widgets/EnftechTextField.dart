import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EnftechTextField extends StatefulWidget {
  final String? title;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  EnftechTextField({this.title, this.onChanged, this.controller});

  @override
  State<EnftechTextField> createState() => _EnftechTextFieldState();
}

class _EnftechTextFieldState extends State<EnftechTextField> {
  late TextEditingController secondController;
  @override
  void initState() {
    final controller = widget.controller ?? TextEditingController();
    this.secondController = controller;
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            widget.title ?? "",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 17,
                color: Colors.black),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: this.secondController,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
