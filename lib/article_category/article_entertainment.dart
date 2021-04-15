//import 'dart:convert';
//
//import 'package:http/http.dart' as http;
//
//const apiKey = '749bee4eadc94eccb7715224b9243c34';
//final String url = 'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&$apiKey';
//
//class Entertainment {
//  Future getEntertainmentNews() async {
//    http.Response response = await http.get(url);
//      var data = response.body;
//      List articleEntertainment = jsonDecode(data)['articles'];
//      print(articleEntertainment[2]);
//  }
//}

