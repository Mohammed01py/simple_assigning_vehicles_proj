
import 'dart:io';
/*
import 'package:assignment_three/bicycle.dart';
import 'package:assignment_three/car.dart';
import 'package:assignment_three/electric_bicycle.dart';
import 'package:assignment_three/electric_car.dart';
import 'package:assignment_three/electric_powered.dart';
import 'package:assignment_three/vehicle_status.dart';
*/
import 'package:assignment_three/vehicles.dart';
import 'dart:convert';

// Save to JSON
void saveVehicles(List<Vehicles> vehicles) {
  File file = File('vehicles.json');
  
  // v stands for vehicle
  List<Map<String, dynamic>> jsonList = vehicles.map((v) => v.toJson()).toList();
  file.writeAsStringSync(jsonEncode(jsonList));



  /*
  List<Map<String, dynamic>> jsonList = vehicles.map((v) {
    if (v is Car) {
      return {
        'type': 'Car',
        'name': v.name,
        'maxSpeed': v.maxSpeed,
        'status': v.status.toString().split('.').last,
        'batteryLevel': v is ElectricPowered ? v.batteryLevel : null // Include batteryLevel only for electric vehicles
      };
    } else if (v is Bicycle) {
      return {
        'type': 'Bicycle',
        'name': v.name,
        'maxSpeed': v.maxSpeed,
        'status': v.status.toString().split('.').last
      };
    }
    return {};
  }).toList().cast<Map<String, dynamic>>(); //

  // Write JSON to file
  file.writeAsStringSync(jsonEncode(jsonList));
} */

}