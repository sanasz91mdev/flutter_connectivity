import 'package:connectivity_flutter/inherited_connectivity_test/context.dart';
import 'package:flutter/material.dart';

void main() => runApp(LocationContextExampleApp());

class LocationContextExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConnectivityContext.around(
      MaterialApp(
        title: 'Connectivity Demo',
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
            Row(
              children: <Widget>[
                Text(
                  'Wifi connectivity:  ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  loc.connectivity.substring(loc.connectivity.indexOf('.') + 1),
                ),
              ],
            ),
            RaisedButton(
              child: Text('Next >>'),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new WidgetB()));
              },
            )
          ],
        ));
  }
}

class WidgetB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WidgetBState();
}

class _WidgetBState extends State<WidgetB> {
  @override
  Widget build(BuildContext context) {
    var connectivityContext = ConnectivityContext.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Another Widget'),
        ),
        body:
//        Column(
//          children: <Widget>[
//            Text('Sana'),
//            Text('Zehra'),
//            connectivityContext.showSnackBar
//                ? Scaffold.of(context).showSnackBar(SnackBar(
//                      content: Text('i am not connected :('),
//                      duration: Duration(seconds: 5),
//                    ))
//                : Container()
//          ],
//        )
      Builder(builder: (BuildContext context) {
        if (connectivityContext.showSnackBar) {
          Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('i am not connected :('),
                duration: Duration(seconds: 5),
              ));
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('connected :)'),
                duration: Duration(seconds: 5),
              ));
        }
        return Column(
          children: <Widget>[
            Text('Sana'),
            Text('Zehra'),
          ],
        );
      }),
        );
  }
}
