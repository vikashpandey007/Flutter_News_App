import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share/share.dart';

class NextPage extends StatefulWidget {
  final data, index;
  NextPage(this.data, this.index);

  @override
  _NextPageState createState() => _NextPageState(this.data, this.index);
}

class _NextPageState extends State<NextPage> {
    spin() {
    return SpinKitCircle(color: Colors.red);
  }
  void next() {
    setState(() {
      if (index1 <= data1.length) {
        index1++;
      }
    });
  }

  void previous() {
    setState(() {
      index1--;
    });
  }

  var data1, index1;

  _NextPageState(this.data1, this.index1);
  @override
  Widget build(BuildContext context) {
    return data1!=null?
     Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          title: Text("Top News"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  Share.share(data1[index1]['url']);
                })
          ],
        ),
        body: ListView(children: <Widget>[
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 24,
            child: Container(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data1[index1]['title'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Card(
            child: Container(
                // margin: EdgeInsets.all(8),
                child: Image.network(data1[index1]["urlToImage"],
                    fit: BoxFit.fill)),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 24,
            child: Container(
              margin: EdgeInsets.all(15),
              child: Text(
                data1[index1]['content'],
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.navigate_before,
                  size: 40,
                ),
                onPressed: () {
                  previous();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.navigate_next,
                  size: 40,
                ),
                onPressed: () {
                  next();
                },
              ),
            ],
          )
        ])):spin();
  }
}
