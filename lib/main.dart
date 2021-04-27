import 'package:flutter/material.dart';
import 'package:exercise1/widget/buttonWidget.dart';
import 'package:exercise1/widget/sliderWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'My Icon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _colors = Colors.blue;
  var _size = 400.0; //initial icon size
  double value = 0.0; //slider current value

  double r = 0; //RGB color
  double g = 0; //RGB color
  double b = 0; //RGB color
  bool _allowResize = true; //start with true (allow to resize)
  bool _allowChangeColor = true; //start with true (allow to change color)

  get color => _colors;
  set color(value) => setState(() => _colors = value);

  get size => _size; //use to get color value
  set size(value) => setState(() => _size = value); //use to set color value

  //var _value = true;

  void _doNothing() {}
  updateSize(double size) {
    if (size >= 100 && size <= 400) setState(() => _size = size);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: <Widget>[
          if (_allowResize == true)
            IconButton(
              icon: Icon(Icons.remove_circle_rounded, size: 35),
              onPressed: () => updateSize(_size - 50),
            ),
          if (_allowResize == true)
            IconButton(
              icon: Icon(Icons.remove_circle_rounded, size: 35),
              onPressed: () => updateSize(100),
            ),
          if (_allowResize == true)
            ElevatedButton(
              child: Text('M'),
         
              onPressed: () => updateSize(200),
            ),
          if (_allowResize == true)
            IconButton(
              icon: Icon(Icons.remove_circle_rounded, size: 35),
              onPressed: () => updateSize(400),
            ),
          if (_allowResize == true)
            IconButton(
              icon: Icon(Icons.add_circle_rounded, size: 35),
              onPressed: () => updateSize(_size + 50),
            ),
        ]),
        drawer: Drawer(
          child: ListView(
            children: [
              CheckboxListTile(
                value: _allowResize,
                onChanged: (value) {
                  setState(() => _allowResize = value);
                },
                title: Text("Allow Resize?"),
              ),
              CheckboxListTile(
                value: _allowChangeColor,
                onChanged: (value) {
                  setState(() => _allowChangeColor = value);
                },
                title: Text("Allow change primer colour?"),
              ),
            ],
          ),
        ),
        body: Center(
          child: Container(
            child: Icon(
              Icons.alarm,
              size: this._size,
              color: Color.fromRGBO(
                  this.r.toInt(), this.g.toInt(), this.b.toInt(), 1),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 200,
          child: Container(
            child: Row(
         
              children: [
                if (_allowChangeColor == true)
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                    

                        SliderWidget(this.r, (double value) {
                          //get red value color
                          setState(() {
                            r = value.roundToDouble();
                          });
                        }),
                        SliderWidget(this.g, (double value) {
                          //get green value color
                          setState(() {
                            g = value.roundToDouble();
                          });
                        }),
                        SliderWidget(this.b, (double value) {
                          //get blue value color
                          setState(() {
                            b = value.roundToDouble();
                          });
                        }),
                      ],
                    ),
                  ),
                if (_allowChangeColor == true)
                  Expanded(
                    child: Column(
                   
                      children: [
                        ButtonWidget(this.r.toInt(), () {
                          setState(() {
                            r = 255;
                            g = 0;
                            b = 0;
                          });
                        }, 255, 0, 0),
                        ButtonWidget(this.g.toInt(), () {
                          setState(() {
                            r = 0;
                            g = 255;
                            b = 0;
                          });
                        }, 0, 0, 255),
                        ButtonWidget(this.b.toInt(), () {
                          setState(() {
                            r = 0;
                            g = 0;
                            b = 255;
                          });
                        }, 0, 255, 0),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
