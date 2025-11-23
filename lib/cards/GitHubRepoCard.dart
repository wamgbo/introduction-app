import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class GitHubRepoCard extends StatefulWidget {
  final String user;
  final String repo;

  const GitHubRepoCard({
    super.key,
    required this.user,
    required this.repo,
  });

  @override
  State<GitHubRepoCard> createState() => _GitHubRepoCardState();
}

class _GitHubRepoCardState extends State<GitHubRepoCard> {
  Map<String, dynamic>? repoData;

  @override
  void initState() {
    super.initState();
    fetchRepo();
  }

  Future<void> fetchRepo() async {
    final url =
        'https://api.github.com/repos/${widget.user}/${widget.repo}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        repoData = json.decode(response.body);
      });
    }
  }

  void _openGitHub() async {
    final Uri url =
        Uri.parse('https://github.com/${widget.user}/${widget.repo}');
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    if (repoData == null) {
      return Center(child: CircularProgressIndicator());
    }

    return InkWell(
      onTap: _openGitHub,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              repoData!['full_name'],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              repoData!['description'] ?? 'No description',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 6),
                Text(
                  repoData!['stargazers_count'].toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
