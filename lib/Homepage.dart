import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/NextPage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  spin() {
    return SpinKitCircle(color: Colors.red);
  }

  emptyimage() {
   return Container(
     color: Colors.black,
     height: 50,
    
    //   child: Image(
    //     image: AssetImage("assets/empty.jpeg"),
    //   )
     );
  }

  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

  var btn1 = false;
  var btn2 = false;
  var data;
  String categaryname = "Top News";
  // var apikey = "cc5fc60821744d5d839348e0d10b145b";
  String url =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=cc5fc60821744d5d839348e0d10b145b";
  Future<String> getjsondata() async {
    var responese = await http.get(Uri.encodeFull(url));
    setState(() {
      var convertdata = json.decode(responese.body);
      data = convertdata['articles'];
      print(data);
    });
  }

  @override
  void initState() {
    getjsondata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return data != null
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              // backgroundColor: Colors.white,
              title: Text(categaryname),
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Sub-categories",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    onTap: null,
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.business),
                    title: Text(
                      "Bussiness",
                      style: TextStyle(fontSize: 25),
                    ),
                    onTap: () {
                      categaryname = "Bussiness";
                      url =
                          "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=cc5fc60821744d5d839348e0d10b145b";
                      getjsondata();
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.radio),
                    title: Text(
                      "Entertainment",
                      style: TextStyle(fontSize: 25),
                    ),
                    onTap: () {
                      categaryname = "Entertainment";
                      url =
                          "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=cc5fc60821744d5d839348e0d10b145b";
                      getjsondata();
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.healing),
                    title: Text(
                      "Health",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    onTap: () {
                      categaryname = "Health";
                      url =
                          "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=cc5fc60821744d5d839348e0d10b145b";
                      getjsondata();
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.memory),
                    title: Text(
                      "Science",
                      style: TextStyle(fontSize: 25),
                    ),
                    onTap: () {
                      categaryname = "Science";
                      url =
                          "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=cc5fc60821744d5d839348e0d10b145b";
                      getjsondata();
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.directions_run),
                    title: Text(
                      "Sports",
                      style: TextStyle(fontSize: 25),
                    ),
                    onTap: () {
                      categaryname = "Sports";
                      url =
                          "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=cc5fc60821744d5d839348e0d10b145b";
                      getjsondata();
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.mobile_screen_share),
                    title: Text(
                      "Technology",
                      style: TextStyle(fontSize: 25),
                    ),
                    onTap: () {
                      categaryname = "Technology";
                      url =
                          "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=cc5fc60821744d5d839348e0d10b145b";
                      getjsondata();
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Dark Mode",
                      style: TextStyle(fontSize: 25),
                    ),
                    trailing: Switch(
                      value: btn1,
                      onChanged: (bool value) {
                        changeBrightness();
                        setState(() {
                          btn1 = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            body: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    
                    ListTile(
                      leading:data[index]["urlToImage"]!=null? Container(
                          height: 50,
                          width: 80,
                          child: Image.network(data[index]["urlToImage"],
                              fit: BoxFit.fill)):emptyimage(),
                      title: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NextPage(
                                        data,
                                        index,
                                      )));
                        },
                        child: Text(data[index]['title'],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                );
              },
            ))
        : spin();
  }
}
