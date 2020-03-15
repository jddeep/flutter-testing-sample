import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Tester',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blue,
          accentColor: Colors.white),
      home: MyHomePage(title: 'Calculator Tester'),
    );
  }
}

class Calculator {
  static String calculate(String operation, String numone, String numtwo) {
    if (numone.isEmpty || numtwo.isEmpty) return null;

    switch (operation) {
      case '+':
        return (int.parse(numone) + int.parse(numtwo)).toString();
      case '-':
        return (int.parse(numone) - int.parse(numtwo)).abs().toString();
      case '*':
        return (int.parse(numone) * int.parse(numtwo)).toString();
      case '/':
        return (int.parse(numone) / int.parse(numtwo)).toString();
      case '^':
        return pow(int.parse(numone), int.parse(numtwo)).toString();
      default:
        return '';
    }
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String _operator = '';
  var numberoneController = TextEditingController();
  var numbertwoController = TextEditingController();

  Widget _button(String operation) {
    // Creating a method of return type Widget with number and function f as a parameter
    return MaterialButton(
        height: 100.0,
        child: Text(operation,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 50.0)),
        textColor: Colors.black,
        color: Colors.grey[100],
        key: Key(operation),
        onPressed: () {
          setState(() {
            numberoneController.text = Calculator.calculate(
                operation, numberoneController.text, numbertwoController.text);
            numbertwoController.text = '';
            print(numberoneController.text);
            _operator = numberoneController.text.isNotEmpty ? '=' : '';
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 80.0,
                  child: Tooltip(
                    message: 'Number two',
                    child: TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 8,
                      key: Key('numbertwo'),
                      controller: numbertwoController,
                    ),
                  ),
                ),
                Container(
                    child: Text(
                  _operator,
                  key: Key('operator'),
                )),
                Container(
                  width: 80.0,
                  child: Tooltip(
                    message: 'Number one',
                    child: TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 8,
                      key: Key('numberone'),
                      controller: numberoneController,
                    ),
                  ),
                )
              ],
            )),
          ),
          Expanded(
            flex: 7,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: new GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                padding: const EdgeInsets.all(4.0),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                children: <String>[
                  // @formatter:off
                  '+', '-', '*',
                  '/', '^', '=',
                  // @formatter:on
                ].map((key) {
                  return new GridTile(
                    child: _button(key),
                  );
                }).toList(),
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //     _button('+'),
          //     _button('-'),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //     _button('*'),
          //     _button('/'),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //     _button('^'),
          //     _button('='),
          //   ],
          // ),
        ],
      ),
    );
  }
}
