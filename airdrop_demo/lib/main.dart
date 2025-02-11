import 'package:airdrop_demo/Pages/signuppage.dart';
import 'package:airdrop_demo/model/cards.dart';
import 'package:airdrop_demo/model/tasks.dart';
import 'package:airdrop_demo/model/user.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:airdrop_demo/Pages/airdroppage.dart';
import 'package:airdrop_demo/Pages/cardspage.dart';
import 'package:airdrop_demo/Pages/invitepage.dart';
import 'package:airdrop_demo/Pages/taskspage.dart';
import 'package:airdrop_demo/Pages/homepage.dart';
import 'package:airdrop_demo/model/color.dart';

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

// https://coolors.co/palette/386641-6a994e-a7c957-f2e8cf-bc4749

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
  late final UserProfile _user = UserProfile()..userName = 'FineGuy';

  @override
  void initState() {
    super.initState();
    _listPages
      ..add(const HomePage())
      ..add(const TasksPage())
      ..add(const CardsPage())
      ..add(const InvitePage())
      ..add(const AirdropPage());

    _currentPage = const HomePage();
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
              'Hello, ${_user.userName}',
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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person))],
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

final List<CardModel> cards = [
  CardModel(
    title: 'Coding Enthusiast',
    profitPerHour: 90,
    level: 0,
    imageUrl:
        'https://img.icons8.com/?size=100&id=l0UsZRTvcGel&format=png&color=000000',
    price: 220,
  ),
  CardModel(
    title: 'Crypto Expert',
    profitPerHour: 120,
    level: 0,
    imageUrl:
        'https://img.icons8.com/?size=100&id=FTifzX1R9L50&format=png&color=000000',
    price: 300,
  ),
  CardModel(
    title: 'Blockchain Developer',
    profitPerHour: 150,
    level: 0,
    imageUrl:
        'https://img.icons8.com/?size=100&id=FHQYz1px0h83&format=png&color=000000',
    price: 400,
  ),
  CardModel(
    title: 'NFT Artist',
    profitPerHour: 180,
    level: 0,
    imageUrl:
        'https://img.icons8.com/?size=100&id=V4tgjfG0kSwY&format=png&color=000000',
    price: 500,
  ),
  CardModel(
    title: 'DeFi Expert',
    profitPerHour: 210,
    level: 0,
    imageUrl:
        'https://img.icons8.com/?size=100&id=E9E7pTmioS0q&format=png&color=000000',
    price: 600,
  ),
  CardModel(
    title: 'Web3 Developer',
    profitPerHour: 240,
    level: 0,
    imageUrl:
        'https://img.icons8.com/?size=100&id=e2r7vNlIEGCx&format=png&color=000000',
    price: 700,
  ),
  CardModel(
    title: 'Metaverse Creator',
    profitPerHour: 270,
    level: 0,
    imageUrl:
        'https://img.icons8.com/?size=100&id=fL5cWET9Paxh&format=png&color=000000',
    price: 800,
  ),
  CardModel(
    title: 'AI Specialist',
    profitPerHour: 300,
    level: 0,
    imageUrl:
        'https://img.icons8.com/?size=100&id=6az9wbEz5UKE&format=png&color=000000',
    price: 900,
  ),
  CardModel(
    title: 'Game Developer',
    profitPerHour: 330,
    level: 0,
    imageUrl:
        'https://img.icons8.com/?size=100&id=SrX1UAxClVFN&format=png&color=000000',
    price: 1000,
  ),
  CardModel(
    title: 'Cybersecurity Expert',
    profitPerHour: 360,
    level: 0,
    imageUrl:
        'https://img.icons8.com/?size=100&id=YhicuoJvXeaI&format=png&color=000000',
    price: 1100,
  ),
  CardModel(
    title: 'Quantum Computing Expert',
    profitPerHour: 390,
    level: 0,
    imageUrl:
        'https://img.icons8.com/?size=100&id=dAIe2P09btNH&format=png&color=000000',
    price: 1200,
  ),
  CardModel(
    title: 'Space Explorer',
    profitPerHour: 420,
    level: 0,
    imageUrl:
        'https://img.icons8.com/?size=100&id=eulnKXXLCS2i&format=png&color=000000',
    price: 1300,
  ),
  CardModel(
    title: 'AI Robot',
    profitPerHour: 450,
    level: 0,
    imageUrl:
        'https://img.icons8.com/?size=100&id=GBu1KXnCZZ8j&format=png&color=000000',
    price: 1400,
  ),
  CardModel(
    title: 'AI Avatar',
    profitPerHour: 480,
    level: 0,
    imageUrl:
        'https://img.icons8.com/?size=100&id=6az9wbEz5UKE&format=png&color=000000',
    price: 1500,
  ),
];

List<Task> fineDropTasks = [
  Task(
    taskImage:
        'https://img.icons8.com/?size=100&id=phOKFKYpe00C&format=png&color=000000', // Placeholder image
    taskName: 'Follow FineDrop on X',
    taskLink: 'https://x.com/FineDrop',
    taskReward: 3000,
    taskStatus: TaskStatus.incompleted,
  ),
  Task(
    taskImage:
        'https://img.icons8.com/?size=100&id=13912&format=png&color=000000', // Placeholder image
    taskName: 'Like FineDrop on Facebook',
    taskLink: 'https://facebook.com/FineDrop',
    taskReward: 1500,
    taskStatus: TaskStatus.incompleted,
  ),
  Task(
    taskImage:
        'https://img.icons8.com/?size=100&id=119026&format=png&color=000000', // Placeholder image
    taskName: 'Share FineDrop on Instagram',
    taskLink: 'https://instagram.com/FineDrop',
    taskReward: 2000,
    taskStatus: TaskStatus.incompleted,
  ),
  Task(
    taskImage:
        'https://img.icons8.com/?size=100&id=2mIgusGquJFz&format=png&color=000000', // Placeholder image
    taskName: 'Join FineDrop on Discord',
    taskLink: 'https://discord.com/invite/FineDrop',
    taskReward: 2500,
    taskStatus: TaskStatus.incompleted,
  ),
  Task(
    taskImage:
        'https://img.icons8.com/?size=100&id=19318&format=png&color=000000', // Placeholder image
    taskName: 'Subscribe to FineDrop on YouTube',
    taskLink: 'https://youtube.com/c/FineDrop',
    taskReward: 3000,
    taskStatus: TaskStatus.incompleted,
  ),
  Task(
    taskImage:
        'https://img.icons8.com/?size=100&id=63306&format=png&color=000000', // Placeholder image
    taskName: 'Subscribe to FineDrop on Telegram',
    taskLink: 'https://t.me/FineDrop',
    taskReward: 3000,
    taskStatus: TaskStatus.incompleted,
  )
];
