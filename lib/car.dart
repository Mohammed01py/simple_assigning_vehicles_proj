// ignore_for_file: use_super_parameters

import 'package:assignment_three/electric_powered.dart';
import 'package:assignment_three/vehicle_status.dart';
import 'package:assignment_three/vehicles.dart';


class Car extends Vehicles with ElectricPowered {
  Car(String name, int maxSpeed, VehicleStatus status): super(name, maxSpeed, status);

  @override
  void move() {
    print("The $name is moving at $maxSpeed km/h");
    useBattery(20);
  }  
}