import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'secondpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'BMI CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0, _age = 25, _weight = 50;
  double _height = 150;
  String _gender = '';
  bool _selectgenderM = false, _selectgenderF = false;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 10, 13, 34).withOpacity(0.9),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 10, 13, 34),
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.sort_outlined)),
          centerTitle: true,
          title: Text(widget.title),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 70,
            child: TextButton(
              child: Text(
                'CALCULATE YOUR BMI',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OutputPage(
                              weight: _weight,
                              height: _height,
                              gender: _gender,
                            )));
              },
            ),
            color: Color.fromARGB(255, 235, 21, 85),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                child: Row(
                  //for gender selection widget
                  children: [
                    Expanded(
                      flex: 4,
                      child: Card(
                          color: Color(0xFF1D1E33),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_selectgenderF == false) {
                                        _selectgenderM = !_selectgenderM;
                                        _gender = 'M';
                                      }
                                    });
                                  },
                                  icon: Icon(Icons.male_outlined),
                                  color: _selectgenderM
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.1),
                                  iconSize: 80,
                                ),
                                Text(
                                  'MALE',
                                  style: TextStyle(
                                      color: _selectgenderM
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.1)),
                                ),
                              ],
                            ),
                            width: 180,
                            height: 160,
                          )),
                    ),
                    Expanded(
                      flex: 4,
                      child: Card(
                        color: Color(0xFF1D1E33),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_selectgenderM == false) {
                                      _selectgenderF = !_selectgenderF;
                                      _gender = 'F';
                                    }
                                  });
                                },
                                icon: Icon(Icons.female_outlined),
                                color: _selectgenderF
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.1),
                                iconSize: 80,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                    color: _selectgenderF
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.1)),
                              ),
                            ],
                          ),
                          width: 180,
                          height: 160,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //for height selection
                  children: [
                    Expanded(
                      flex: 1,
                      child: Card(
                        color: Color(0xFF1D1E33),
                        child: Container(
                          padding: EdgeInsets.only(top: 12.0),
                          width: 250,
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'HEIGHT',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(_height.toInt().toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.bold)),
                                  Text(' cm',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: Colors.white,
                                  inactiveTrackColor: Colors.white,
                                  trackShape: RectangularSliderTrackShape(),
                                  trackHeight: 1.5,
                                  thumbColor: Color.fromARGB(255, 235, 21, 85),
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 14.0),
                                  overlayColor: Color.fromARGB(255, 235, 21, 85)
                                      .withAlpha(80),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 28.0),
                                ),
                                child: Slider(
                                  value: _height,
                                  min: 100,
                                  divisions: 100,
                                  max: 200,
                                  onChanged: (double h) {
                                    setState(() {
                                      _height = h;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //for weight and age selection
                  children: [
                    Expanded(
                      flex: 4,
                      child: Card(
                          color: Color(0xFF1D1E33),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'WEIGHT',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.8)),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  _weight.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _weight--;
                                        });
                                      },
                                      child: Icon(CupertinoIcons.minus),
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(15.0),
                                          primary: Color(0xFF4C4F5E)),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _weight++;
                                        });
                                      },
                                      child: Icon(CupertinoIcons.plus),
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(15.0),
                                          primary: Color(0xFF4C4F5E)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            width: 180,
                            height: 200,
                          )),
                    ),
                    Expanded(
                      flex: 4,
                      child: Card(
                          color: Color(0xFF1D1E33),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'AGE',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.8)),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  '$_age',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _age--;
                                        });
                                      },
                                      child: Icon(CupertinoIcons.minus),
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(15.0),
                                          primary: Color(0xFF4C4F5E)),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _age++;
                                        });
                                      },
                                      child: Icon(CupertinoIcons.plus),
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.all(15.0),
                                          primary: Color(0xFF4C4F5E)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            width: 180,
                            height: 200,
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
