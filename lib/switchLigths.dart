class SwitchLigths {
  bool _lightState = true;

  bool readState() => _lightState;

  void changeState() {
    _lightState = !_lightState;
  }
}
