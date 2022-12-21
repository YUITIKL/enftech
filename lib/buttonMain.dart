import 'package:enftech/dripScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonMain extends StatefulWidget {
  final String title;
  final String image;

  ButtonMain(this.title, this.image);

  @override
  State<ButtonMain> createState() => _ButtonMainState();
}

class _ButtonMainState extends State<ButtonMain> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
          height: 80,
          width: 1000,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                elevation: MaterialStateProperty.all(5)),
            onPressed: () {
              print("Tá chamando");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DripScreen()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.start,
                ),
                Image(
                  image: AssetImage(widget.image),
                  width: 25,
                  height: 45,
                )
              ],
            ),
          )),
    );
  }
}
