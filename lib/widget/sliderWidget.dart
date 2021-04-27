import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final double colorValue;
  final Function onChanged;
  final double _minValue = 0.0; //slider range
  final double _maxValue = 255.0;

  SliderWidget(this.colorValue, this.onChanged);
  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: Colors.brown,
      inactiveColor: Colors.brown[200],
      value: this.colorValue,
      min: _minValue,
      max: _maxValue,
      onChanged: onChanged,
    );
  }
}
