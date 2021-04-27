import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final int colorValue;
  final Function changeColor;
  final int red, blue, green;

  ButtonWidget(
      this.colorValue, this.changeColor, this.red, this.blue, this.green);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(this.red, this.green, this.blue, 1),
        onPressed: changeColor,
        child: Text(colorValue.toString()),
      ),
    );
  }
}
