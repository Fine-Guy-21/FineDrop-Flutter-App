import 'dart:async';
import 'package:airdrop_demo/model/cards.dart';
import 'package:airdrop_demo/model/tasks.dart';
import 'package:flutter/foundation.dart';

class UserProfile {
  int? id = 1;
  String? userName;
  int pointPerTap = 1;
  double userPoints = 4121;
  int nextLevel = 5000;
  double profitPerHour = 0;
  double mineEnergy = 3000;
  double maxMineEnergy = 3000;
  bool isactive = false;
  bool _isReSt = false;
  List<Task>? tasks;
  List<CardModel>? cards = [];
  List<UserProfile> friends = [];
  int fullenergy = 6;
  int maxfullenergy = 6;
  int multitaplevel = 1;
  double multitapPrice = 300;
  int energylimitlevel = 1;
  double energylimitPrice = 500;

  Timer? timer;

  void pointsForNextLevel() {
    if (userPoints >= nextLevel) {
      nextLevel = nextLevel * 5;
    }
  }

  void depleteEnergy() {
    if (mineEnergy == 0) {
      mineEnergy += maxMineEnergy;
    } else {
      mineEnergy--;
    }
  }

  void startEnergyReplenishment() {
    debugPrint('clicked');
    if (_isReSt) {
      return;
    }
    _isReSt = true;
    Stream s = Stream.periodic(const Duration(seconds: 1), (t) {
      if (mineEnergy < maxMineEnergy) {
        mineEnergy++;
      }
    });
    s.listen((x) {});
  }

  bool mutlitapIncrement() {
    if (userPoints >= multitapPrice) {
      userPoints -= multitapPrice;
      multitapPrice *= 1.5;
      multitaplevel++;
      pointPerTap = multitaplevel;
      return true;
    } else {
      return false;
    }
  }

  bool energyLimitIncrement() {
    if (userPoints >= energylimitPrice) {
      userPoints -= energylimitPrice;
      energylimitPrice *= 1.5;
      energylimitlevel++;
      maxMineEnergy *= 1.2;
      return true;
    } else {
      return false;
    }
  }

  bool useboostenergy() {
    if (fullenergy > 0) {
      mineEnergy = maxMineEnergy;
      fullenergy--;
      return true;
    }
    else{
      return false;
    }
  }

  void replenisFullEnergy(){
    DateTime now = DateTime.now().toUtc();

  // Check if it's past 23:00 UTC
  if (now.hour == 23 && now.minute == 0) {
    fullenergy = maxfullenergy;
  }
  }

  void startTimer() {
  Timer.periodic(const Duration(minutes: 1), (timer) {
    replenisFullEnergy();
  });
}
}
