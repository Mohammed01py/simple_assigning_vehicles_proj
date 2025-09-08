import 'package:assignment_three/electric_powered.dart';
import 'package:assignment_three/vehicle_status.dart';
import 'package:assignment_three/vehicles.dart';

class ElectricCar extends Vehicles with ElectricPowered {
  ElectricCar(String name, int maxSpeed, VehicleStatus status) : super(name, maxSpeed, status);

  @override
  void move() {
    print("The $name is moving at $maxSpeed km/h");
    useBattery(20);
  }

  @override
  void displayInfo() {
    print("Name: $name\nMax Speed: $maxSpeed km/h\nStatus: $status\nBattery Level: $batteryLevel%\n");
  }
  @override
  Map<String, dynamic> toJson() {
    return super.toJson()
      ..addAll({
        'type': 'ElectricCar',
        'batteryLevel': batteryLevel,
      });
  }
}
