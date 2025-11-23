import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '/cards/GitHubRepoCard.dart';

class Githubpage extends StatelessWidget {
  const Githubpage({super.key});

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
              'Github',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 34,
              ),
            ),
            SizedBox(height: 10),
            GitHubRepoCard(user: 'wamgbo', repo: 'ChatPHP'),
            GitHubRepoCard(user: 'wamgbo', repo: 'Todolist'),
            GitHubRepoCard(user: 'wamgbo', repo: 'finalProject'),
            Row(children: [GithubButton()]),
          ],
        ),
      ),
    );
  }
}

class GithubButton extends StatelessWidget {
  const GithubButton({super.key});

  // Facebook 網頁 URL
  final String fbUrl = 'https://github.com/wamgbo';

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
        'assets/images/github.png', // <-- 你的 github 圖片
        width: 100,
        height: 100,
      ),
    );
  }
}
