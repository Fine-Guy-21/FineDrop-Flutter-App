import 'package:finedrop/Pages/loginpage.dart';
import 'package:finedrop/model/user.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finedrop/Pages/airdroppage.dart';
import 'package:finedrop/Pages/cardspage.dart';
import 'package:finedrop/Pages/invitepage.dart';
import 'package:finedrop/Pages/taskspage.dart';
import 'package:finedrop/Pages/homepage.dart';
import 'package:finedrop/model/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    await Future.delayed(const Duration(seconds: 10));
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
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
            ),
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

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MySccaffold();
          } else {
            return const LoginPage();
          }
        },
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
  late final UserProfile user =
      UserProfile(userName: 'FineGuy', email: '21fineguy@gmail.com');

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
