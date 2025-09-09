
import 'dart:io';
import 'package:assignment_three/vehicles.dart';
import 'dart:convert';

// Save to JSON
void saveVehicles(List<Vehicles> vehicles) {
  try {
  // Convert all vehicles to JSON + v stands for vehicle
    List<Map<String, dynamic>> jsonList = vehicles.map((v) => v.toJson()).toList();
    
    // Create the file
    File file = File('vehicles.json');
  
  file.writeAsStringSync(jsonEncode(jsonList), mode: FileMode.write);
  print("Vehicles have been saved to vehicles.json");
  } catch (e) {
    print("Error saving vehicles: $e");
  }
}