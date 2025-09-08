import 'vehicle_status.dart';

abstract class Vehicles {
  String name;           // Req1: Create an abstract class Vehicle with these properties:
  int maxSpeed;
  VehicleStatus status;

  Vehicles(this.name, this.maxSpeed, this.status);
  
  void move();           // Abstract Method
  void displayInfo(){   // Concrete Method
    print("Name: $name\nMax Speed: $maxSpeed km/h\nStatus: $status\n");
  }
  
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'maxSpeed': maxSpeed,
      'status': status.toString().split('.').last,
    };
  }
}