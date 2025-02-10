import 'dart:async';
import 'package:airdrop_demo/model/cards.dart';
import 'package:airdrop_demo/model/tasks.dart';
import 'package:flutter/foundation.dart';

class UserProfile {
  int? id;
  String? userName;
  double pointPerTap;
  double userPoints;
  int nextLevel;
  double profitPerHour;
  double mineEnergy;
  double maxMineEnergy;
  bool isactive;
  bool _isReSt = false;
  List<Task> tasks = [];
  List<CardModel>? cards;
  List<UserProfile> friends;
  int fullenergy;
  int maxfullenergy;
  double multitaplevel;
  double multitapPrice;
  int energylimitlevel;
  double energylimitPrice;
  int minutes = 0;
  Timer? timer;

  UserProfile({
    this.id = 1,
    this.userName,
    this.pointPerTap = 1,
    this.userPoints = 1,
    this.nextLevel = 5000,
    this.profitPerHour = 0,
    this.mineEnergy = 3000,
    this.maxMineEnergy = 3000,
    this.isactive = false,
    this.tasks = const [],
    this.cards,
    this.friends = const [],
    this.fullenergy = 6,
    this.maxfullenergy = 6,
    this.multitaplevel = 1,
    this.multitapPrice = 300,
    this.energylimitlevel = 1,
    this.energylimitPrice = 500,
  });

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

  void profitperhourupdate(){
    minutes++;
    if (minutes == 60){
      minutes = 0;
      userPoints += profitPerHour;
    }
  }

  void startTimer() {
  Timer.periodic(const Duration(minutes: 1), (timer) {
    replenisFullEnergy();
    profitperhourupdate();
  });
}

// Convert UserProfile to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userName": userName,
      "pointPerTap": pointPerTap,
      "userPoints": userPoints,
      "nextLevel": nextLevel,
      "profitPerHour": profitPerHour,
      "mineEnergy": mineEnergy,
      "maxMineEnergy": maxMineEnergy,
      "isactive": isactive,
      "fullenergy": fullenergy,
      "maxfullenergy": maxfullenergy,
      "multitaplevel": multitaplevel,
      "multitapPrice": multitapPrice,
      "energylimitlevel": energylimitlevel,
      "energylimitPrice": energylimitPrice,
      "friends": friends.map((friend) => friend.toJson()).toList(),
      "cards": cards?.map((card) => card.toJson()).toList() ?? [],
      "tasks": tasks.map((task) => task.toJson()).toList(),
    };
  }
  
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json["id"],
      userName: json["userName"],
      pointPerTap: json["pointPerTap"],
      userPoints: json["userPoints"].toDouble(),
      nextLevel: json["nextLevel"],
      profitPerHour: json["profitPerHour"].toDouble(),
      mineEnergy: json["mineEnergy"].toDouble(),
      maxMineEnergy: json["maxMineEnergy"].toDouble(),
      isactive: json["isactive"],
      fullenergy: json["fullenergy"],
      maxfullenergy: json["maxfullenergy"],
      multitaplevel: json["multitaplevel"],
      multitapPrice: json["multitapPrice"].toDouble(),
      energylimitlevel: json["energylimitlevel"],
      energylimitPrice: json["energylimitPrice"].toDouble(),
      friends: (json["friends"] as List)
          .map((friend) => UserProfile.fromJson(friend))
          .toList(),
      cards: (json["cards"] as List?)
          ?.map((card) => CardModel.fromJson(card))
          .toList(),
      tasks: (json["tasks"] as List?)
          !.map((task) => Task.fromJson(task))
          .toList(),
    );
  }

}


