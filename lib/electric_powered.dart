mixin ElectricPowered {
  int batteryLevel=100; // Req: "default 100"

  void chargeBattery(int amount){ // Req: Method chargeBattery(int amount)
  batteryLevel= batteryLevel+amount;
  if(batteryLevel > 100) batteryLevel = 100;
  print("Battery level: $batteryLevel");
  }
  
  void useBattery(int amount){    // Req: Method useBattery(int amount)
  batteryLevel=batteryLevel-amount;
  if(batteryLevel<0) batteryLevel=0;
  print("The battery is $batteryLevel, please charge it");
  }
}