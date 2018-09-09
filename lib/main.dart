import 'package:flutter/material.dart';
import 'package:connectivity_flutter/inherited_connectivity_test/context.dart';

void main() => runApp(LocationContextExampleApp());

class LocationContextExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConnectivityContext.around(
      MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: App2(),
      ),
    );
  }
}

class App2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => App2State();
}

class App2State extends State<App2> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ConnectivityContext loc = ConnectivityContext.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
        ),
        body: Column(
          children: <Widget>[
            Text('Sana Zehra'),
            Text(
              loc.connectivity,
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ));
  }
}