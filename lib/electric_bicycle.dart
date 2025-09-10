import 'package:assignment_three/electric_powered.dart';
import 'package:assignment_three/vehicles.dart';

class ElectricBicycle extends Vehicles with ElectricPowered {
  ElectricBicycle(super.name, super.maxSpeed, super.status);

  // From Req
  @override
  void move() {
    print("$name is moving at $maxSpeed km/h");
    useBattery(10);
  }


  // From Req
  @override
  void displayInfo() {
    print("Name: $name\nMax Speed: $maxSpeed km/h\nStatus: $statusString\nBattery Level: $batteryLevel%\n");
  }
  @override
  Map<String, dynamic> toJson() {
    return super.toJson()
      ..addAll({
        'type': 'ElectricBicycle',
        'batteryLevel': batteryLevel,
      });
  }
}