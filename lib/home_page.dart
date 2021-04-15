import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternewsapp/news_categories/business_news.dart';
import 'package:flutternewsapp/news_categories/entertainment_news.dart';
import 'package:flutternewsapp/news_categories/general_news.dart';
import 'package:flutternewsapp/news_categories/health_news.dart';
import 'package:flutternewsapp/news_categories/science_news.dart';
import 'package:flutternewsapp/news_categories/sports_news.dart';
import 'package:flutternewsapp/news_categories/technology_news.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Swaraj',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'News',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
        children: <Widget>[
          GridViewItems(
            imageUrl:
                'https://1yfd8w35xqq41q3ou63czp8h-wpengine.netdna-ssl.com/wp-content/uploads/2018/10/350x215-FEAT-in-post-Entertainment.jpg',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return EntertainmentNews();
                  },
                ),
              );
            },
          ),
          GridViewItems(
            imageUrl:
                'https://d3kc5zpr3x9db9.cloudfront.net/6cd586a7c118c555e7a04d6867a0aaa2_1539399804417.jpeg',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SportsNews();
                  },
                ),
              );
            },
          ),
          GridViewItems(
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRd_pAQdiM7ZVKGJ6zenj4SimSlZh65tK19BLejY8NC-mwPhXNV&usqp=CAU',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ScienceNews();
                  },
                ),
              );
            },
          ),
          GridViewItems(
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQlXhK4R3Xa9SGdHH8CB6KRjwqNxrPlXhhQdfgNgSwSFHsIHDDi&usqp=CAU',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return BusinessNews();
                  },
                ),
              );
            },
          ),
          GridViewItems(
            imageUrl:
                'https://specials-images.forbesimg.com/imageserve/5d9182dc6c7c8f000990b672/960x0.jpg?fit=scale',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TechnologyNews();
                  },
                ),
              );
            },
          ),
          GridViewItems(
            imageUrl:'https://cdn.dribbble.com/users/71890/screenshots/2368143/health_news.jpg',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HealthNews();
                  },
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GeneralNews();
                    },
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20.0),
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Color(0xFFEE82EE),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'General',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'News',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GridViewItems extends StatelessWidget {
  final String imageUrl;
  final Function onPress;
  final String text;
  GridViewItems({this.imageUrl, this.onPress, this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}
