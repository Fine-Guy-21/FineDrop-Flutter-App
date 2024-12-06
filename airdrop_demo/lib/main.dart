import 'package:flutter/material.dart';
import 'package:airdrop_demo/Pages/airdrop.dart';
import 'package:airdrop_demo/Pages/cards.dart';
import 'package:airdrop_demo/Pages/invite.dart';
import 'package:airdrop_demo/Pages/tasks.dart';

import 'package:airdrop_demo/Pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Airdrop Demo',
      home: MySccaffold(),
    );
  }
}

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
      ..add(const InvitePage())
      ..add(const TasksPage())
      ..add(const CardsPage())
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
      // bottomNavigationBar: ,
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.blue[900],
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