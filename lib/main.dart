import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

const double lat = 13.062000;
const double long = 80.236313;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Food Map'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Open Google Map',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: GoogleMaps,
              color: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }
}

//method to launch maps
GoogleMaps() async {
  const urlMap = "https://www.google.com/maps/search/?api=1&query=$lat,$long";
  if (await canLaunch(urlMap)) {
    await launch(urlMap);
  } else {
    throw 'Could not launch Maps';
  }
}
