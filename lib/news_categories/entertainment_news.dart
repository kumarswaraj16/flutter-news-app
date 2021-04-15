import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutternewsapp/articles.dart';

const apiKey = '749bee4eadc94eccb7715224b9243c34';
final String url =
    'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=$apiKey';

class EntertainmentNews extends StatefulWidget {
  @override
  _EntertainmentNewsState createState() => _EntertainmentNewsState();
}

class _EntertainmentNewsState extends State<EntertainmentNews> {
  bool isLoading = false;
  List news;

  @override
  void initState() {
    super.initState();
    getEntertainmentNews();
  }

  Future<String> getEntertainmentNews() async {
    http.Response response = await http.get(url);
    setState(() {
      var entertainmentNews = jsonDecode(response.body);
      news = entertainmentNews['articles'];
      isLoading = true;
    });
    return 'Success';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Entertainment News',
            style: TextStyle(
                color: Colors.purpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
        ),
      ),
      body: NewsPage(isLoading: isLoading, news: news),
    );
  }
}

