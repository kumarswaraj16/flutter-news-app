import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

String data;
String search;

class _SearchPageState extends State<SearchPage> {
  Future<void> getNews() async {
    http.Response response = await http.get(
        'https://newsapi.org/v2/everything?q=$search&apiKey=48a3f8a4729349309eb96d25c6ecc431');
    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        data = response.body;
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '${search!=null?search:'Search News'}',
          style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            search = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 100,
                    child: FlatButton(
                      color: Colors.lightBlueAccent,
                      child: Text(
                        'Search',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        getNews();
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: data == null
                ? Center(
              child: Text('Search news'),
            )
                : Container(
              child: GridView.builder(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(jsonDecode(data)['articles']
                        [index]['urlToImage'] ==
                            null
                            ? 'images/paceholder.png'
                            : jsonDecode(data)['articles'][index]
                        ['urlToImage']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Colors.black.withOpacity(.7),
                          ),
                          child: Text(
                            jsonDecode(data)['articles'][index]['title'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: jsonDecode(data)['articles'].length > 20
                    ? 20
                    : jsonDecode(data)['articles'].length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}