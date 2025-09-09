import 'vehicle_status.dart';

abstract class Vehicles {
  String name;           // Req1: Create an abstract class Vehicle with these properties:
  int maxSpeed;
  VehicleStatus status;

  Vehicles(this.name, this.maxSpeed, this.status);

  String get statusString => status.toString().split('.').last;
  
  void move();           // Abstract Method
  void displayInfo(){   // Concrete Method
    print("Name: $name\nMax Speed: $maxSpeed km/h\nStatus: $statusString\n");
  }
  


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'maxSpeed': maxSpeed,
      'status': statusString,
    };
  }
}