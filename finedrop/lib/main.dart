import 'package:finedrop/Pages/signuppage.dart';
import 'package:finedrop/model/user.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:finedrop/Pages/airdroppage.dart';
import 'package:finedrop/Pages/cardspage.dart';
import 'package:finedrop/Pages/invitepage.dart';
import 'package:finedrop/Pages/taskspage.dart';
import 'package:finedrop/Pages/homepage.dart';
import 'package:finedrop/model/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.surfaceColor,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.secondaryColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Airdrop Demo',
      home: const SplashScreen(), // Start with the SplashScreen
    );
  }
}

// SplashScreen Widget
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    // Simulate a loading delay (or perform initialization tasks)
    await Future.delayed(
        const Duration(seconds: 10)); // Adjust duration if needed
    // Navigate to the main scaffold
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/FineDrop.png'),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              color: AppColors.primaryColor,
            ), // Loading animation
            const SizedBox(height: 20),
            const Text(
              "Loading... Please wait",
              style: TextStyle(fontSize: 20, color: AppColors.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}

//Home Widget loader
class MySccaffold extends StatefulWidget {
  const MySccaffold({super.key});

  @override
  State<MySccaffold> createState() => _MySccaffoldState();
}

class _MySccaffoldState extends State<MySccaffold> {
  int _currentIndex = 0;
  final List _listPages = [];
  late Widget _currentPage;
  late final UserProfile user = UserProfile(userName: 'FineGuy');

  @override
  void initState() {
    super.initState();

    _listPages
      ..add(HomePage(user: user))
      ..add(TasksPage(user: user))
      ..add(CardsPage(user: user))
      ..add(InvitePage(user: user))
      ..add(AirdropPage(user: user));

    _currentPage = HomePage(user: user);
  }

  void _changePages(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surfaceColor,
        leading: Image.asset('assets/FineDrop.png'),
        title: AnimatedTextKit(
          onTap: () => {},
          animatedTexts: [
            TyperAnimatedText(
              'Hello, ${user.userName}',
              textStyle: const TextStyle(
                fontSize: 20,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.start,
              speed: const Duration(milliseconds: 100),
            )
          ],
          totalRepeatCount: 2,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                size: 30,
              ))
        ],
      ),
      backgroundColor: AppColors.backgroundColor,
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: AppColors.surfaceColor,
        fixedColor: AppColors.primaryColor,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: AppColors.primaryColor,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_outlined, color: AppColors.primaryColor),
              label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.charging_station_outlined,
                  color: AppColors.primaryColor),
              label: 'Cards'),
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.group_add_outlined, color: AppColors.primaryColor),
              label: 'Invite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_outlined,
                  color: AppColors.primaryColor),
              label: 'Airdrop'),
        ],
        onTap: (selectedIndex) => _changePages(selectedIndex),
      ),
    );
  }
}
