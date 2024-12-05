import 'package:flutter/material.dart';
import 'package:airdrop_demo/model/user.dart';
import 'package:airdrop_demo/widgets/circleButton.dart';

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
                child: Text(
                  'Hello, ${_user.userName}',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 5),
            // Statistics Bar
            Center(
              child: Container(
                padding: const EdgeInsets.all(6),
                height: screenHeight * (15 / 100),
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[900],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: screenWidth * (30 / 100),
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        "Points Per Tap \n ${_user.pointPerTap}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * (30 / 100),
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        "Next level \n ${_user.nextLevel}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * (30 / 100),
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        "Profit per hour \n ${_user.profitPerHour}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 5),

            Container(
              margin: const EdgeInsets.fromLTRB(6, 15, 6, 15),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: screenWidth,
              height: screenHeight * (65 / 100),
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.monetization_on_outlined,
                          size: 30, color: Colors.yellow),
                      Text(
                        ' ${_user.userPoints}',
                        style:const TextStyle(fontSize: 24, color: Colors.white),
                      )
                    ],
                  ),
                  // User amout & progress bar
                  Container(
                    padding: const EdgeInsets.all(6),
                    width: screenWidth * (70 / 100),
                    child: LinearProgressIndicator(
                      value: (_user.userPoints/_user.nextLevel),
                      backgroundColor: Colors.blue,
                      color: Colors.white,
                    ),
                  ),
                  
                  // Tap circle
                  /* Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    height: screenHeight * (45 / 100),
                    width: screenWidth * (75 / 100),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(120),
                        color: Colors.blue[900]),
                    child: Image.asset(
                      'assets/ai-generated-8618574_1280.png',
                    ),
                  ), */
                  const SizedBox(height: 5,),
                  
                  Center(
                    child: CircleButton(user: _user),
                  ),
                  
                  // Energy & Boost
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.architecture_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            '3000/3000',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: ElevatedButton(
                            onPressed: () => {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: const Text(
                              'Boost',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
