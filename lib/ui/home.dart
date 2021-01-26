import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiState ();
  }

}

class BmiState extends State<Bmi> {

  final TextEditingController _agecontroller = new TextEditingController();
  final TextEditingController _heightcontroller = new TextEditingController();
  final TextEditingController _weightcontroller = new TextEditingController();
  double inche = 0.0;
  double result = 0.0;

  void _calculate() {
    setState(() {
      int age = int.parse(_agecontroller.text);
      double height = double.parse(_heightcontroller.text);
      double weight = double.parse(_weightcontroller.text);
      inche = height * 12;
      if (
       (_agecontroller.text.isEmpty || age > 0)
          && ((_heightcontroller.text.isEmpty || inche > 0)
          && (_weightcontroller.text.isEmpty || weight > 0))
      )
        {
          result=weight/(inche*inche)*703;
        }
      else
        {
          result=0.0;
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Bmi"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(5.0),
          children: <Widget>[
            new Image.asset(
              'images/bmilogo.png',
              height: 85.0,
              width: 75.0,
            ),
            new Container(
              margin: EdgeInsets.all(5.0),
              height: 290.0,
              width: 290.0,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _agecontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "age",
                      hintText: 'e.g:34',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new TextField(
                    controller: _heightcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "height in feet",
                      hintText: 'e.g:6.5',
                      icon: new Icon(Icons.insert_chart),
                    ),
                  ),
                  new TextField(
                    controller: _weightcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "weight in lbs",
                      hintText: 'e.g:180',
                      icon: new Icon(Icons.line_weight),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      onPressed: () => debugPrint('hello'),
                      color: Colors.pinkAccent,
                      child: new Text('Calculate'),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "BMI: $result",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 19.9,
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(10.0)),
                new Text(
                  'Overweight:',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 19.9,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}