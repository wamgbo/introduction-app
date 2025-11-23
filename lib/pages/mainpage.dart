import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class autobiography extends StatelessWidget {
  const autobiography({super.key});

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
              '自我介紹:',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 34,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                border: Border.all(color: Colors.grey[800]!, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                "我是一名熱愛技術的學生，對 Linux 與 Homelab 架設非常感興趣。平時會在 Linux 環境中學習與實驗，喜歡透過指令列提升效率並深入理解系統運作。我也常在 Homelab 裝設各種服務，像是虛擬化、容器化及自架伺服器，用來練習部署與管理系統。透過實作累積經驗，我希望在系統管理與雲端自架環境方面持續成長。",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            // FB 按鈕
            Row(children: [FacebookButton(), SizedBox(width: 20), IGButton()]),
          ],
        ),
      ),
    );
  }
}

// Facebook 點擊按鈕 Widget
class FacebookButton extends StatelessWidget {
  const FacebookButton({super.key});

  // Facebook 網頁 URL
  final String fbUrl = 'https://www.facebook.com/';

  // 打開 URL
  void _launchURL() async {
    final Uri url = Uri.parse(fbUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $fbUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: Image.asset(
        'assets/images/fb.png', // <-- 你的 FB 圖片
        width: 100,
        height: 100,
      ),
    );
  }
}

class IGButton extends StatelessWidget {
  const IGButton({super.key});

  // Facebook 網頁 URL
  final String IGUrl = 'https://www.instagram.com/';

  // 打開 URL
  void _launchURL() async {
    final Uri url = Uri.parse(IGUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $IGUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: Image.asset(
        'assets/images/ig.png', // <-- 你的 IG 圖片
        width: 100,
        height: 100,
      ),
    );
  }
}
