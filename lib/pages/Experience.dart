import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '/cards/GitHubRepoCard.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text("個人簡介", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 1.0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NAEM',
                      style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
                    ),
                    Text(
                      '王傳博',
                      style: TextStyle(
                        color: Colors.amberAccent,
                        letterSpacing: 2.0,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierColor: Colors.black87, // 背景遮罩
                      builder: (_) {
                        return GestureDetector(
                          onTap: () => Navigator.pop(context), // 點擊關閉
                          child: Center(
                            child: Hero(
                              tag: 'zoom-img',
                              child: Image.asset(
                                'assets/images/icon.png', // 換成你的圖
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Hero(
                    tag: 'zoom-img',
                    child: Image.asset(
                      'assets/images/icon.png', // 小圖
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              '學歷:',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 34,
              ),
            ),
            Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                border: Border.all(color: Colors.grey[800]!, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "虎尾科技大學一年級 ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "高雄科技大學二年級 ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            Text(
              '證照&校外活動:',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 34,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height:  1240,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                border: Border.all(color: Colors.grey[800]!, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierColor: Colors.black87, // 背景遮罩
                        builder: (_) {
                          return GestureDetector(
                            onTap: () => Navigator.pop(context), // 點擊關閉
                            child: Center(
                              child: Hero(
                                tag: 'zoom-img',
                                child: Image.asset(
                                  'assets/images/AWSre.png', // 換成你的圖
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Hero(
                      tag: 'zoom-img',
                      child: Image.asset(
                        'assets/images/AWSre.png', // 換成你的圖
                        width: 300,
                        height: 300,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierColor: Colors.black87, // 背景遮罩
                        builder: (_) {
                          return GestureDetector(
                            onTap: () => Navigator.pop(context), // 點擊關閉
                            child: Center(
                              child: Hero(
                                tag: 'zoom-img',
                                child: Image.asset(
                                  'assets/images/pvqc.png', // 換成你的圖
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Hero(
                      tag: 'zoom-img',
                      child: Image.asset(
                        'assets/images/pvqc.png', // 換成你的圖
                        width: 300,
                        height: 300,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierColor: Colors.black87, // 背景遮罩
                        builder: (_) {
                          return GestureDetector(
                            onTap: () => Navigator.pop(context), // 點擊關閉
                            child: Center(
                              child: Hero(
                                tag: 'zoom-img',
                                child: Image.asset(
                                  'assets/images/awsedu1.jpg', // 換成你的圖
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Hero(
                      tag: 'zoom-img',
                      child: Image.asset(
                        'assets/images/awsedu1.jpg', // 換成你的圖
                        width: 300,
                        height: 300,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierColor: Colors.black87, // 背景遮罩
                        builder: (_) {
                          return GestureDetector(
                            onTap: () => Navigator.pop(context), // 點擊關閉
                            child: Center(
                              child: Hero(
                                tag: 'zoom-img',
                                child: Image.asset(
                                  'assets/images/awsedu2.jpg', // 換成你的圖
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Hero(
                      tag: 'zoom-img',
                      child: Image.asset(
                        'assets/images/awsedu2.jpg', // 換成你的圖
                        width: 300,
                        height: 300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
