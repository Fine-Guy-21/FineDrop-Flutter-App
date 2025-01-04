import 'package:flutter/material.dart';
import 'package:airdrop_demo/Pages/airdrop.dart';
import 'package:airdrop_demo/Pages/cards.dart';
import 'package:airdrop_demo/Pages/invite.dart';
import 'package:airdrop_demo/Pages/tasks.dart';
import 'package:airdrop_demo/Pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Airdrop Demo',
      home: SplashScreen(), // Start with the SplashScreen
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
    await Future.delayed(const Duration(seconds: 3)); // Adjust duration if needed

    // Navigate to the main scaffold
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MySccaffold()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flutter_dash, size: 100, color: Colors.blue), // Replace with your logo
            SizedBox(height: 20),
            CircularProgressIndicator(), // Loading animation
            SizedBox(height: 10),
            Text("Loading... Please wait"),
          ],
        ),
      ),
    );
  }
}

// Your existing MySccaffold setup remains the same
class MySccaffold extends StatefulWidget {
  const MySccaffold({super.key});

  @override
  State<MySccaffold> createState() => _MySccaffoldState();
}

class _MySccaffoldState extends State<MySccaffold> {
  int _currentIndex = 0;
  final List _listPages = [];
  late Widget _currentPage;

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
      backgroundColor: Colors.blue[300],
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue[900],
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.blue[700],
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_outlined, color: Colors.blue[700]),
              label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.charging_station_outlined,
                  color: Colors.blue[700]),
              label: 'Cards'),
          BottomNavigationBarItem(
              icon: Icon(Icons.group_add_outlined, color: Colors.blue[700]),
              label: 'Invite'),
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.monetization_on_outlined, color: Colors.blue[700]),
              label: 'Airdrop'),
        ],
        onTap: (selectedIndex) => _changePages(selectedIndex),
      ),
    );
  }
}





























/* class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
 */