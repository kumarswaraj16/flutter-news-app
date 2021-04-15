import 'package:flutter/material.dart';
import 'package:flutternewsapp/description.dart';
import 'package:flutternewsapp/search_news.dart';
////import 'package:http/http.dart' as http;
////import 'dart:convert';

//const apiKey = '749bee4eadc94eccb7715224b9243c34';

class NewsPage extends StatefulWidget {
  final bool isLoading;
  final List news;
  NewsPage({this.isLoading, this.news});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
//  String search;
//  List news;
//  bool isLoading;
//  Future<void> getSearchedNews(String search) async {
//    isLoading = false;
//    http.Response response = await http
//        .get('https://newsapi.org/v2/everything?q=$search&apiKey=$apiKey');
//    setState(() {
//      news = jsonDecode(response.body)['articles'];
//      isLoading = true;
//    });
//  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            'Search News',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          color: Colors.teal,
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
            });
          },
        ),
        Expanded(
          child: Container(
            child: widget.isLoading
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.news == null ? 0 : widget.news.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              splashColor: Colors.greenAccent,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return NewsDescription(
                                        content: widget.news[index]['content'],
                                        imageUrl: widget.news[index]
                                            ['urlToImage'],
                                        title: widget.news[index]['title'],
                                        url: widget.news[index]['url'],
                                        source: widget.news[index]['source']
                                            ['name'],
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Image.network(
                                  '${widget.news[index]['urlToImage'] != null ? widget.news[index]['urlToImage'] : ''}'),
                            ),
                          ),
                          Divider(),
                          ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.circular(20.0),
                            child: Card(
                              color: Colors.blueGrey,
                              child: Text(
                                '${widget.news[index]['title'] != null ? widget.news[index]['title'] : ''}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Card(
                              shadowColor: Colors.yellow,
                              color: Colors.black,
                              child: Text(
                                '${widget.news[index]['description'] != null ? widget.news[index]['description'] : ''}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Divider(
                            height: 20.0,
                            color: Colors.purpleAccent,
                            thickness: 5.0,
                          ),
                        ],
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 10.0,
                      backgroundColor: Colors.purpleAccent,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
