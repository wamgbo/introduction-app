import 'package:flutter/material.dart';
import 'pages/mainpage.dart';
import 'pages/Experience.dart';
import 'pages/githubpage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_octicons/flutter_octicons.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeWithBottomNav(),
    );
  }
}

class HomeWithBottomNav extends StatefulWidget {
  const HomeWithBottomNav({super.key});
  @override
  State<HomeWithBottomNav> createState() => _HomeWithBottomNavState();
}

class _HomeWithBottomNavState extends State<HomeWithBottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    autobiography(),
    Githubpage(),
    Experience(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '自傳'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.github, size: 30), label: 'github'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: '學經歷'),
        ],
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
