import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(title: "Contador de Pessoas", home: Home()),
    );

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _numPeople = 0;
  String _mainMessage = "Pode entrar";

  void _handleChangePeople(int newValue) {
    setState(() {
      _numPeople += newValue;

      if (_numPeople < 0) {
        _mainMessage = "Mundo invertido??";
      } else if (_numPeople >= 50) {
        _mainMessage = "Lotado!!!";
      } else {
        _mainMessage = "Pode entrar";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/people.jpeg", fit: BoxFit.cover, height: 1000.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_numPeople",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("+1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () { _handleChangePeople(1);},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () { _handleChangePeople(-1);},
                  ),
                ),
              ],
            ),
            Text("$_mainMessage",
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 25)),
          ],
        ),
      ],
    );
  }
}
