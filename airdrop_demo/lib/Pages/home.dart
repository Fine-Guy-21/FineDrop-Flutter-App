import 'package:flutter/material.dart';
import 'package:airdrop_demo/model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    UserProfile _user = UserProfile()..userName = 'FineGuy';



  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 100;
    final screenWidth = MediaQuery.of(context).size.width - 30;

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SafeArea(
        child: Column(
          children: [
            // as an App Bar
            Center(
              child: Container(
                height: screenHeight * (9 / 100),
                width: screenWidth,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[900]),
                child:Text(
                  'Hello, ${_user.userName}',
                  style:const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 5),
            // Statistics Bar 
            Center(
              child:Container(
                  margin: const EdgeInsets.all(6),
                  padding: const EdgeInsets.all(6),  
                  height: screenHeight * (15/100),
                  width: screenWidth,                 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[900],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                                Container(
                                    width: screenWidth*(30/100),
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[600],
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Text(
                                      "Points Per Tap \n ${_user.pointPerTap}",
                                      textAlign: TextAlign.center,
                                      style:const TextStyle(
                                        fontSize: 14,
                                      ),  
                                    ),
                                  ),
                                  
                                  Container(
                                    width: screenWidth*(30/100),
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[600],
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Text(
                                      "Next level \n ${_user.nextLevel}",
                                      textAlign: TextAlign.center,
                                      style:const TextStyle(
                                        fontSize: 14,
                                      ),  
                                    ),
                                  ),
                                  
                                  Container(
                                    width: screenWidth*(30/100),
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[600],
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child:  Text(
                                      "Profit per hour \n ${_user.profitPerHour}",
                                      textAlign: TextAlign.center,
                                      style:const TextStyle(
                                        fontSize: 14,
                                      ),  
                                    ),
                                  ),
                              ],
                  ),
                ),
            ),

          ],
        ),
      ),
    );
  }
}
