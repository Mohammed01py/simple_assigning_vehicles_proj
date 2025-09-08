import 'dart:io';

import 'package:assignment_three/bicycle.dart';
import 'package:assignment_three/electric_bicycle.dart';
import 'package:assignment_three/electric_car.dart';
import 'package:assignment_three/load_vehicles.dart';
import 'package:assignment_three/save_vehicles.dart';
import 'package:assignment_three/vehicles.dart';
import 'package:assignment_three/vehicle_status.dart';
import 'package:assignment_three/car.dart';


void main(){
  List<Vehicles> vehicles = loadVehicles();

    while (true) {
    // Ask you for vehicle type
    stdout.write("What vehicle type you wanna choose? (1): for normal car. (2): for normal bicycle. (3): for electric car. (4): for electric bicycle. (5): to exit and see the \"Vehicle Report\":\n");
    String? choice = stdin.readLineSync();

    if (choice == '5') {
      // Exit loop if you type '5'
      break;
    }

    stdout.write("What's the vehicle name?\n");
    String? name = stdin.readLineSync(); // Get vehicle name

    stdout.write("What's the vehicle speed limit?\n");
    int maxSpeed = int.parse(stdin.readLineSync()!); // Get speed limit

    stdout.write("Type what's your vehicle status (idle, moving, maintenance):\n");
    String? statusInput = stdin.readLineSync(); // Get status
    VehicleStatus status;
    try {
      // A really important thing I have learnt about ".values" which will get all values from a map or enum.
      status = VehicleStatus.values.firstWhere(    
      (e) => e.toString().split('.').last == statusInput, orElse: () { // In this line we converted enum to string
        throw Exception("Invalid status");       }, // "e.toString": It will looks like "VehicleStatus.available"
    ); // ".split('.')": Splits the string at the "."
        

    } catch (e) {
    print("Wrong choose , Choose from idle, moving, maintenance");
    continue;
    }

    if (choice == '1') {
      vehicles.add(Car(name!, maxSpeed, status));                  // Add normal car to list
    } else if (choice == '2') {
      vehicles.add(Bicycle(name!, maxSpeed, status));             // Add bicycle to list
    } else if (choice =='3'){
      vehicles.add(ElectricCar(name!, maxSpeed, status));        // Add electric car to list
    } else if (choice == '4') {
      vehicles.add(ElectricBicycle(name!, maxSpeed, status));   // Add electric bicycle
    }
     else {
      stdout.write("Wrong choice, try again!");
    }
  }

  // Filtering Area
  stdout.write("Do you want to filter by status? y=\"yes\" n=\"no\":\n");
  String? filterChoice = stdin.readLineSync();
  if (filterChoice?.toLowerCase() == 'y') {
    stdout.write("Enter status to filter (idle, moving, maintenance):\n");
    String? filterStatus = stdin.readLineSync();
    vehicles = vehicles.where((v) => v.status.toString().split('.').last == filterStatus).toList();
}

  // Sotring Area
stdout.write("Do you want to sort the report? type (1) for speed, (2) for name, (3) for none:\n");
String? sortChoice = stdin.readLineSync();
if (sortChoice == '1') {
  vehicles.sort((a, b) => b.maxSpeed.compareTo(a.maxSpeed));
} else if (sortChoice == '2') {
  vehicles.sort((a, b) => a.name.compareTo(b.name));
}



  // Display all vehicles
  print("\nVehicle Report:\n---------------");
  for (var vehicle in vehicles) {
    vehicle.displayInfo(); // Call displayInfo() for each vehicle
  }
  saveVehicles(vehicles);
}