import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'switchLigths.dart';
import 'torchSwitch.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.teal,
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
          body: Layout(),
        ),
      ),
    );
  }
}

class Layout extends StatefulWidget {


  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  SwitchLigths switchLigths = SwitchLigths();
  TorchSwitch torchSwitch = TorchSwitch();
  AnimatedPhysicalModel switchLight() {

    return AnimatedPhysicalModel(
      elevation: 5.0,
      shape: BoxShape.circle,
      color: Colors.white70,
      shadowColor: Colors.blue,
      duration: Duration(milliseconds: 300),
      child: RaisedButton(
        color: switchLigths.readState()? Colors.red : Colors.green,
        padding: EdgeInsets.all(35.0),
        shape: CircleBorder(

        ),

        onPressed: () {
          setState(()
          {
            switchLigths.changeState();
            torchSwitch.buttonPressed(switchLigths.readState());
          }
          );
        },


        child: Icon(
          switchLigths.readState() ? Icons.lightbulb_outline : Icons.highlight,
          color: Colors.white,
          size: 44.0,
          semanticLabel: 'light On',
        ),

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
