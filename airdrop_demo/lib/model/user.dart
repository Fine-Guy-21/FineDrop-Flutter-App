
class UserProfile {
  
  String? userName;
  int pointPerTap = 1;
  int userPoints = 21;
  int nextLevel = 1000;
  int profitPerHour = 0;
  int mineEnergy = 3000;
  int maxMineEnergy = 3000;


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

  
}