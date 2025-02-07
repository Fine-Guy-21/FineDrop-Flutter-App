import 'dart:async';

import 'package:flutter/foundation.dart';

class UserProfile {
  int? id = 1;
  String? userName;
  int pointPerTap = 100;
  int userPoints = 21;
  int nextLevel = 1000;
  int profitPerHour = 0;
  int mineEnergy = 3000;
  int maxMineEnergy = 3000;
  bool isactive = false;
  bool _isReSt = false;
  List<UserProfile> friends = [];

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
    debugPrint('clicked');
    if(_isReSt){
      return;
    }
    _isReSt = true;
      // if (timer == null || !(timer!.isActive)) {
      //     timer =Timer.periodic(const Duration(seconds: 2), (timer) {
      //       if (mineEnergy < maxMineEnergy) {            
      //         mineEnergy++;
      //       }else{
      //         timer.cancel();
      //       }
      //     });    
      // }
      Stream s = Stream.periodic(const Duration(seconds: 1), (t){
        if(mineEnergy<maxMineEnergy){
          mineEnergy++;
        }
        debugPrint("Updting");
        
      });
      s.listen((x){});
      
  }
  
}