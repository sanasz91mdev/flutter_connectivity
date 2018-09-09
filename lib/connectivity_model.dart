import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';


class Configurations
{
  final Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  String connectionStatus = 'Unknown';
  String get status => connectionStatus;


  Configurations initConfigurations()
  {
    try {
      initConnectivity();
      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen((
              ConnectivityResult result) {
            connectionStatus = result.toString();
          });
      print('status' + connectionStatus);
      return this;
    }
    catch(e)
    {
      print('exception occurred:'+e.toString());
      throw('unable to process');
    }
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

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

      connectionStatus = connectionStatus;
  }


}