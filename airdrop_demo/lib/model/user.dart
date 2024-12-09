import 'dart:async';

class UserProfile {
  
  String? userName;
  int pointPerTap = 1;
  int userPoints = 21;
  int nextLevel = 1000;
  int profitPerHour = 0;
  int mineEnergy = 3000;
  int maxMineEnergy = 3000;
  bool isactive = false;
  Timer? timer;

 void pointsForNextLevel() {
  if (userPoints >= nextLevel){
    nextLevel =  nextLevel * 5; 
  }
}
  void depleteEnergy(){
    if (mineEnergy ==  0){
      mineEnergy += maxMineEnergy; 
    }
    else{
      mineEnergy--;
    }
  }   

  void startEnergyReplenishment() {
      if (timer == null || !(timer!.isActive)) {
          timer =Timer.periodic(const Duration(seconds: 2), (timer) {
            if (mineEnergy < maxMineEnergy) {            
              mineEnergy++;
            }else{
              timer.cancel();
            }
          });    
      }
      
  }
  
}