import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDescription extends StatefulWidget {
  final String imageUrl;
  final String url;
  final String content;
  final String title;
  final String source;
  NewsDescription(
      {this.content, this.title, this.imageUrl, this.url, this.source});
  @override
  _NewsDescriptionState createState() => _NewsDescriptionState();
}

class _NewsDescriptionState extends State<NewsDescription> {
  _launchURL() async {
    var url = widget.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment(-1.05, 1),
              child: IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Hero(
              tag: widget.imageUrl,
              child: Image.network(widget.imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
            ),
            Text(
              '${widget.title != null ? widget.title : ''}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            Text(
              '${widget.content != null ? widget.content : ''}',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            FlatButton(
              onPressed: _launchURL,
              child: Text(
                'Read Full News',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
              color: Colors.greenAccent,
              splashColor: Colors.purpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0,),
                side: BorderSide.none,
              ),
            ),

          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '${widget.source!=null?widget.source:''}',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
