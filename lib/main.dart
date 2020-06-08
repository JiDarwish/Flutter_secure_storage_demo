import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String text = 'init';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Text(text),
            RaisedButton(
              onPressed: () async {
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // await prefs.setString('key', 'secret');
                final storage = new FlutterSecureStorage();
                await storage.write(key: 'key', value: 'secret');
              },
              child: Text('Save'),
            ),
            RaisedButton(
              onPressed: () async {
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // final String secret = prefs.getString('key');
                final storage = new FlutterSecureStorage();
                String secret = await storage.read(key: 'key');
                setState(() {
                  text = secret;
                });
                print(secret);
              },
              child: Text('Retrieve'),
            )
          ],
        ),
      ),
    );
  }
}
