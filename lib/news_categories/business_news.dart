import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutternewsapp/articles.dart';

const apiKey = '749bee4eadc94eccb7715224b9243c34';
final String url =
    'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=$apiKey';


class BusinessNews extends StatefulWidget {
  @override
  _BusinessNewsState createState() => _BusinessNewsState();
}

class _BusinessNewsState extends State<BusinessNews> {
  bool isLoading = false;
  List news;

  @override
  void initState() {
    super.initState();
    getBusinessNews();
  }
  Future<String> getBusinessNews() async {
    http.Response response = await http.get(url);
    setState(() {
      var businessNews = jsonDecode(response.body);
      news = businessNews['articles'];
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
            'Business News',
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
