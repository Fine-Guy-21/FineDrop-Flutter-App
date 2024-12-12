import 'package:flutter/material.dart';

import '../model/user.dart';

class EnergyBoost extends StatelessWidget {
  final UserProfile user;
  const EnergyBoost({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 100;
    final screenWidth = MediaQuery.of(context).size.width - 30;

    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        title: const Text("Welcome to boost & shops "),
        backgroundColor: Colors.blue[800],
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                height: screenHeight * 0.95,
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[800],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 40,
                    ),
                    // User point & progress
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Current User point
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.monetization_on_outlined,
                                size: 30, color: Colors.yellow),
                            Text(
                              ' ${user.userPoints}',
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
                            value: (user.userPoints / user.nextLevel),
                            backgroundColor: Colors.blue,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 40,
                    ),

                    const Text(
                      'Free Daily Boost',
                      style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      margin: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        border: Border.all(
                            color: Colors.blue, width: 2), 
                        borderRadius: BorderRadius.circular(
                            8), 
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(120),
                                    color: Colors.blue[900]),
                                child: Image.asset(
                                  'assets/ai-generated-8618574_1280.png',
                                ),
                              ),
                              const SizedBox(width: 10,),
                              const Column(
                                children: [
                                  Text('Full Energy',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white)),
                                  Text(
                                    '6/6 Available',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: null, 
                              style:ButtonStyle(
                                backgroundColor:MaterialStateProperty.all(Colors.orange),
                                foregroundColor: MaterialStateProperty.all(Colors.blue)
                              ), 
                              child: const Text('Purchase')),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
