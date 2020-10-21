import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:login/login.dart';

void main() {
  runApp(SetupWidget());
}

class SetupWidget extends StatefulWidget {
  @override
  _SetupWidgetState createState() => _SetupWidgetState();
}

class _SetupWidgetState extends State<SetupWidget> {
  bool _setupDone = false;
  GetIt _getIt = GetIt.asNewInstance();

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    return _setupDone ? Application(_getIt) : _loading(platform);
  }

  Widget _loading(TargetPlatform platform) {
    Timer.run(() {
      var env = "dev";
      var platformString = platform.toString().split('.').last;
      configureInfrastructureGetIt(_getIt, [env, platformString].toSet());
      setState(() {
        _setupDone = true;
      });
    });

    return SafeArea(
      child: Center(
        child: Text("Beautiful loading screen"),
      ),
    );
  }
}

class Application extends StatelessWidget {
  GetIt getIt;

  Application(this.getIt);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          MyHomePage(title: 'Demo platform: ' + getIt<PlatformInfo>().platform),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("Menu")),
            ListTile(
              title: Text("Login"),
              onTap: () {
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (context) => new LoginAppWidget()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
