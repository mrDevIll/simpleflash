import 'package:torch_compat/torch_compat.dart';

class TorchSwitch{
  void buttonPressed(bool stateTorch) => stateTorch ? TorchCompat.turnOn() : TorchCompat.turnOff();
}