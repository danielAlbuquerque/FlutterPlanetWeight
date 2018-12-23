import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }

}

class HomeState extends State<Home>{
  final TextEditingController _weightController = new TextEditingController();

  double _finalResult = 0;
  int radioValue = 0;
  String _formattedText = "";

  void handleRadioChange(int value) {
    setState((){
      radioValue = value;

      switch  (radioValue){
        case 0:
            _finalResult = calculateWeight(_weightController.text, 0.06);
            _formattedText = "Your weight on pluto is ${_finalResult.toStringAsFixed(1)}";
            break;
        case 1:
            _finalResult = calculateWeight(_weightController.text, 0.38);
            _formattedText = "Your weight on mars is ${_finalResult.toStringAsFixed(1)}";
            break;
        case 2:
            _finalResult = calculateWeight(_weightController.text, 0.91);
            _formattedText = "Your weight on venus is ${_finalResult.toStringAsFixed(1)}";
            break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Weight on planet x'),
        centerTitle: true,
        backgroundColor: Colors.black38
      ),
      backgroundColor: Colors.blueGrey,

      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/planet.png', height: 133.0, width: 200.0,),

            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(controller: _weightController, keyboardType: TextInputType.number, decoration: new InputDecoration(
                    labelText: 'Your Weight on earth', hintText: 'In pounds', icon: new Icon(Icons.person_outline)
                  ),),

                  new Padding(padding: new EdgeInsets.all(5.0)),

                  //three radio buttons

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // actual radio buttons
                      new Radio<int>(activeColor: Colors.brown, value: 0, groupValue: radioValue, onChanged: handleRadioChange),
                      new Text(
                        'Pluto', style: new TextStyle(color: Colors.white30),
                      ),

                      new Radio<int>(activeColor: Colors.red, value: 1, groupValue: radioValue, onChanged: handleRadioChange),
                      new Text(
                        'Mars', style: new TextStyle(color: Colors.white30),
                      ),

                      new Radio<int>(activeColor: Colors.blue, value: 2, groupValue: radioValue, onChanged: handleRadioChange),
                      new Text(
                        'Venus', style: new TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(15.6),
                  ),
                  new Text(
                    _formattedText.isEmpty ? "Please enter with your weight" : "$_formattedText lbs",
                    style: new TextStyle(color: Colors.white, fontSize: 19.4, fontWeight: FontWeight.w500),
                  )
                ],
                

              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    }

    print("Wrong!!");
    return int.parse("180") * 0.38;
  }

}