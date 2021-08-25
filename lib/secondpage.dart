import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:math';

double _bmi = 0;

class OutputPage extends StatefulWidget {
  const OutputPage(
      {required this.weight, required this.height, required this.gender});
  final int weight;
  final double height;
  final String gender;
  @override
  _OutputPageState createState() => _OutputPageState();
}

class _OutputPageState extends State<OutputPage> {
  var colorvar = Colors.white;
  String result = '', bmival = '';

  void initState() {
    bmival = calcBMI();
    result = dispresult();
  }

  String calcBMI() {
    _bmi = widget.weight / pow(widget.height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String dispresult() {
    if (_bmi >= 25) {
      colorvar = Colors.red;
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      colorvar = Colors.green;
      return 'NORMAL';
    } else {
      colorvar = Colors.yellow;
      return 'UNDERWEIGHT';
    }
  }

  String disprangeop() {
    if (dispresult() == 'OVERWEIGHT') {
      return 'Overweight BMI range:';
    } else if (dispresult() == 'NORMAL') {
      return 'Normal BMI range:';
    } else {
      return 'Underweight BMI range';
    }
  }

  String disprange() {
    if (dispresult() == 'OVERWEIGHT') {
      return 'greater than 25 kg/m2';
    } else if (dispresult() == 'NORMAL') {
      return '18.5 - 25 kg/m2';
    } else {
      return 'less than 18.5 kg/m2';
    }
  }

  String dispadvice() {
    if (dispresult() == 'OVERWEIGHT') {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (dispresult() == 'NORMAL') {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 10, 13, 34),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 10, 13, 34),
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.sort_outlined)),
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 70,
            child: TextButton(
              child: Text(
                'RE-CALCULATE YOUR BMI',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            color: Color.fromARGB(255, 235, 21, 85),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Your Result',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                    color: Color(0xFF1D1E33),
                    child: Container(
                      padding: EdgeInsets.only(top: 12.0),
                      width: 450,
                      height: 200,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            '$result',
                            style: TextStyle(
                                color: colorvar,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            calcBMI(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 80,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            disprangeop(),
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            disprange(),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 10.0, bottom: 10.0, left: 60, right: 60),
                            child: Center(
                              child: Text(
                                dispadvice(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(20.0),
                              color: Color(0xFF1D1E33).withOpacity(0.9),
                              child: RaisedButton(
                                onPressed: () {},
                                child: Text(
                                  'SAVE RESULT',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                color: Color(0xFF1D1E33).withOpacity(0.9),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
