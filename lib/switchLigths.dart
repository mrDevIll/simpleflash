class SwitchLigths{
  bool _lightState = false;

  bool readState() => _lightState;

  void changeState(){
    _lightState = !_lightState;
  }
}