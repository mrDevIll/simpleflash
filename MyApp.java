import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torch_compat/torch_compat.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool lightState = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black45,
          appBar: AppBar(
            centerTitle: true,
            leading: Icon(
                Icons.lightbulb_outline,
                color: Colors.white,
                size: 22.0,
                semanticLabel: 'flash light app',
            ),
            backgroundColor: Colors.green,

            title: const Text('Geeky FlashLight',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              letterSpacing: 2.0,

            ),
            ),

          ),
          body: SwitchLayout(),
        ),
      ),
    );
  }
}

class SwitchLayout extends StatefulWidget {


  @override
  _SwitchLayoutState createState() => _SwitchLayoutState();
}

class _SwitchLayoutState extends State<SwitchLayout> {
  bool lightState = false;

  RaisedButton switchLight({TorchCompat switching}) {
    lightState = !lightState;
    return RaisedButton(
      color: lightState ? Colors.red : Colors.green,
      padding: EdgeInsets.all(35.0),
      shape: CircleBorder(

      ),

      onPressed: () {
        setState(()
            { lightState ? TorchCompat.turnOn() : TorchCompat.turnOff();
            }
            );
      },


      child: Icon(
        lightState ? Icons.lightbulb_outline : Icons.highlight,
        color: Colors.white,
        size: 44.0,
        semanticLabel: 'light On',
      ),

    );

    }


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            switchLight(),

          ],
        ));
  }
}
