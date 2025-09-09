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
  try {
  File file = File('vehicles.json');

  // Check if file exists
  if (!file.existsSync()) {
      print("There's no vehicles.json file");
      return [];
    }
    String content = file.readAsStringSync();

    if (content.trim().isEmpty) {
      print("vehicles.json is empty");
      return [];
    }


  // Decode JSON file 
  List<dynamic> jsonList = jsonDecode(content);

  // Map the JSON back
  return jsonList.map((json) {
    String type = json['type'];
    String name = json['name'];
    int maxSpeed = json['maxSpeed'];
    VehicleStatus status = VehicleStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status']);
        
  switch (type) {
    case 'ElectricCar':
      return ElectricCar(name, maxSpeed, status)..batteryLevel = json['batteryLevel'];
    case 'ElectricBicycle':
      return ElectricBicycle(name, maxSpeed, status)..batteryLevel = json['batteryLevel'];
    case 'Car':
      return Car(name, maxSpeed, status);
    case 'Bicycle':
      return Bicycle(name, maxSpeed, status);
    default:
      print("Unknown vehicle type: $type");
    return null; // will be null if there's nothing
  }
  
  }).whereType<Vehicles>().toList(); // Remoce null values
  } catch (e) {
    print("Error loading vehicles: $e");
    print("Starting with empty list.");
    return [];
  }
}