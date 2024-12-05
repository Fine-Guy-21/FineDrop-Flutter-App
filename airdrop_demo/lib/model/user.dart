
class UserProfile {
  
  String? userName;
  int pointPerTap = 1;
  int userPoints = 0;
  int nextLevel = 5000;
  int profitPerHour = 0;
 void pointsForNextLevel() {

  nextLevel =  nextLevel * 5; 
  }

  
}