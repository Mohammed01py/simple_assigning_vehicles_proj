// ignore_for_file: use_super_parameters

import 'package:assignment_three/vehicles.dart';

class Bicycle extends Vehicles {
  Bicycle(super.name, super.maxSpeed, super.status);

  @override
  void move() {
    print("$name is moving $maxSpeed km/h");
    }
    @override
    Map<String, dynamic> toJson() {
    return super.toJson()..addAll({'type': 'Bicycle'});
  }
}