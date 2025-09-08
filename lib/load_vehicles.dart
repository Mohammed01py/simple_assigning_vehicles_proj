import 'dart:convert';
import 'dart:io';

import 'package:assignment_three/bicycle.dart';
import 'package:assignment_three/car.dart';
import 'package:assignment_three/electric_bicycle.dart';
import 'package:assignment_three/electric_car.dart';
import 'package:assignment_three/vehicle_status.dart';
import 'package:assignment_three/vehicles.dart';

// Load from JSON
List<Vehicles> loadVehicles() {
  File file = File('vehicles.json');

  // Check if file exists
  if (!file.existsSync()) return [];

  // Decode JSON file 
  List<dynamic> jsonList = jsonDecode(file.readAsStringSync());

  // Map the JSON back
  return jsonList.map((json) {
    String type = json['type'];
    String name = json['name'];
    int maxSpeed = json['maxSpeed'];
    VehicleStatus status = VehicleStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status']);

    if (type == 'ElectricCar') {
      return ElectricCar(name, maxSpeed, status)..batteryLevel = json['batteryLevel'];
    } else if (type == 'ElectricBicycle') {
      return ElectricBicycle(name, maxSpeed, status)..batteryLevel = json['batteryLevel'];
    } else if (type == 'Car') {
      return Car(name, maxSpeed, status);
    } else if (type == 'Bicycle') {
      return Bicycle(name, maxSpeed, status);
    }
    return null; // will be null if there's nothing
  }).whereType<Vehicles>().toList(); // Remoce null values
}