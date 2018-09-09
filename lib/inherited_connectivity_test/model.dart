import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';


class Model{
  String connectionStatus='';
  StreamController _streamController = new StreamController<String>();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Connectivity _connectivity = new Connectivity();
  Stream<String> get connectionUpdates => _streamController.stream;

  void updateConnectStatus()
  {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((
            ConnectivityResult result) {
          connectionStatus = result.toString();
          print(connectionStatus);
        });
    _streamController.add(connectionStatus);
  }

  Future<Null> initConnectivity() async {
    String connectionStatus;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      connectionStatus = (await _connectivity.checkConnectivity()).toString();
    } on PlatformException catch (e) {
      print(e.toString());
      connectionStatus = 'Failed to get connectivity.';
    }
  }


}