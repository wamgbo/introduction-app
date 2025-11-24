import 'package:flutter/material.dart';
import 'pages/mainpage.dart';
import 'pages/Experience.dart';
import 'pages/githubpage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const SplashScreen());
  }
}

/// ---------------------------
/// 1. 啟動畫面（顯示 Loading）
/// ---------------------------
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // 延遲 2 秒後切換到主頁
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeWithBottomNav()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850], // 可自行換背景色
      body: Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          color: Colors.lightBlue,
          size: 100,
        ), // 你也可換成動畫 Logo
      ),
    );
  }
}

/// ---------------------------
/// 2. 你的原本首頁（保持不變）
/// ---------------------------
class HomeWithBottomNav extends StatefulWidget {
  const HomeWithBottomNav({super.key});
  @override
  State<HomeWithBottomNav> createState() => _HomeWithBottomNavState();
}

class _HomeWithBottomNavState extends State<HomeWithBottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [autobiography(), Githubpage(), Experience()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: _pages[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12), // 外距
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[800], // 背景色
            borderRadius: BorderRadius.circular(30), // 圓角
            // border: Border.all(color: Colors.blueGrey, width: 2), // 白色外框
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black26,
            //     blurRadius: 6,
            //     offset: Offset(0, 3),
            //   ),
            // ],
          ),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),//調整按鈕之間距離越大越近
            itemPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            backgroundColor: Colors.transparent, // 讓 Container 的背景色顯示
            items: [
              SalomonBottomBarItem(//第三方按鈕
                icon: Icon(Icons.person),
                title: Text("自傳", style: TextStyle(fontSize: 16)),
                // selectedColor: Colors.grey[850],
                // unselectedColor: Colors.grey[850],
                selectedColor: Colors.white,
                unselectedColor: Colors.white,
              ),
              SalomonBottomBarItem(
                icon: Icon(FontAwesomeIcons.github, size: 30),
                title: Text("github", style: TextStyle(fontSize: 16)),
                // selectedColor: Colors.grey[850],
                // unselectedColor: Colors.grey[850],
                selectedColor: Colors.white,
                unselectedColor: Colors.white,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.book),
                title: Text("學經歷", style: TextStyle(fontSize: 16)),
                selectedColor: Colors.white,
                unselectedColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
