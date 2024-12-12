
import 'package:flutter/material.dart';
import 'package:airdrop_demo/model/user.dart';
// import 'package:airdrop_demo/widgets/circleButton.dart';
import 'package:airdrop_demo/widgets/energyBoost.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
     late UserProfile _user = UserProfile()
      ..userName = 'FineGuy';  

   

  void _toggleButton() {
    setState(() {
      _user.userPoints += _user.pointPerTap;
      _user.depleteEnergy();
      _user.pointsForNextLevel();
    });
  }

  
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 100;
    final screenWidth = MediaQuery.of(context).size.width - 30;

    return SafeArea(
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
              child: AnimatedTextKit(
                onTap: () => {},
                animatedTexts: [
                  TyperAnimatedText(
                    'Hello, ${_user.userName}',
                    textStyle:
                        const TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.start,
                    speed: const Duration(milliseconds: 100),
                  )
                ],
                totalRepeatCount: Duration.microsecondsPerDay,
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
                    height: screenHeight*0.09,
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      "Points Per Tap \n ${_user.pointPerTap}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * (30 / 100),
                    height: screenHeight*0.09,
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      "Next level \n ${_user.nextLevel}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * (30 / 100),
                    height: screenHeight*0.09,
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      "Profit per hour \n ${_user.profitPerHour}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 5),

          // Main action area
          Container(
            margin: const EdgeInsets.fromLTRB(6, 15, 6, 15),
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            width: screenWidth,
            height: screenHeight * (70 / 100),
            decoration: BoxDecoration(
              color: Colors.blue[800],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    // Current User point
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.monetization_on_outlined,
                            size: 30, color: Colors.yellow),
                        Text(
                          ' ${_user.userPoints}',
                          style: const TextStyle(
                              fontSize: 24, color: Colors.white),
                        )
                      ],
                    ),

                    // User amount Progress Bar
                    Container(
                      padding: const EdgeInsets.all(6),
                      width: screenWidth * (70 / 100),
                      child: LinearProgressIndicator(
                        value: (_user.userPoints / _user.nextLevel),
                        backgroundColor: Colors.blue,
                        color: Colors.white,
                      ),
                    ),
                  ],
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

               
                // Center(
                //   child: CircleButton(user: _user),
                // ),

                // Tappable area ( Gesture Detector)
                Center(
                  child: GestureDetector(
                    onTap: _toggleButton,
                    child: Container(
                      width: screenWidth*0.8, // Change size as needed
                      height: screenWidth*0.8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue, // Change color based on state
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/ai-generated-8618574_1280.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),

                
                // Energy & Boost ( New Navigation Page required with back button )
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.architecture_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          '${_user.mineEnergy}/${_user.maxMineEnergy}',
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                      child: ElevatedButton(
                          onPressed: () => _openEnergyBoostPage(
                              context: context, fullscreenDialogue: true, user: _user),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text(
                            'Boost',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openEnergyBoostPage(

      {required BuildContext context, bool fullscreenDialogue = false, required UserProfile user}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialogue,
        builder: (context) =>EnergyBoost(user: user),
      ),
    );
  }
}
