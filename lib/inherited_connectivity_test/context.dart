
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';


class ConnectivityContext extends InheritedWidget {
  final String connectivity;

  ConnectivityContext._({
    @required this.connectivity,
    Widget child,
    Key key,
  }) : super(key: key, child: child);

  static Widget around(Widget child, {Key key}) {
    return ConnectivityWrapper(child:child,key: key);
  }

  static ConnectivityContext of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ConnectivityContext);
  }

  @override
  bool updateShouldNotify(ConnectivityContext oldWidget) {
      return connectivity!=oldWidget.connectivity;
  }


}

class ConnectivityWrapper extends StatefulWidget {
  final Widget child;

  ConnectivityWrapper({Key key,this.child}) : super(key: key);


  @override
  _ConnectivityWrapperState createState() => new _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
          setState(() => _connectionStatus = result.toString());
        });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<Null> initConnectivity() async {
    String connectionStatus;
    try {
      connectionStatus = (await _connectivity.checkConnectivity()).toString();
    } on PlatformException catch (e) {
      print(e.toString());
      connectionStatus = 'Failed to get connectivity.';
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _connectionStatus = connectionStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConnectivityContext._(connectivity: _connectionStatus,child: widget.child,);
  }
}