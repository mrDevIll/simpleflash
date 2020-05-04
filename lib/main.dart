import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

import 'switchLigths.dart';
import 'torchSwitch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //disable rotation screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
        title: const Text(
          'Geeky FlashLight',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            letterSpacing: 2.0,
          ),
        ),
      ),
      body: Light(), //calls statefull widget
    )));
  }
}

class Light extends StatefulWidget {
  @override
  _LightState createState() => _LightState();
}

class _LightState extends State<Light> {
  @override
  Widget build(BuildContext context) {
    return Layout();
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
        color: switchLigths.readState() ? Colors.red : Colors.green,
        padding: EdgeInsets.all(35.0),
        shape: CircleBorder(),
        onPressed: () {
          setState(() {
            switchLigths.changeState();
            torchSwitch.buttonPressed(switchLigths.readState());
          });
        },
        child: IconButton(
          icon: switchLigths.readState()
              ? FaIcon(
                  FontAwesomeIcons.powerOff,
                  color: Colors.white,
                  size: 30.0,
                )
              : FaIcon(
                  FontAwesomeIcons.lightbulb,
                  color: Colors.white,
                  size: 30.0,
                ),
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    torchSwitch.buttonPressed(true); //initiate flash
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    torchSwitch.buttonPressed(false);
  }
}
