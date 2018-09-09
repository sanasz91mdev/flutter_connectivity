//import 'dart:async';
//import 'package:connectivity_flutter/connectivity_model.dart';
//import 'package:rxdart/rxdart.dart';
//
//
//class ConnectivityBloc {
//  final Configurations api;
//
//  Stream<String> _results = Stream.empty();
//  Stream<String> _log = Stream.empty();
//
//  ReplaySubject<String> _query = ReplaySubject<String>();
//
//  Stream<String> get log => _log;
//  Stream<String> get results => _results;
//  Sink<String> get query => _query;
//
//  ConnectivityBloc(this.api) {
//    _results = _query.asyncMap(convert);
//
//    _log = Observable(results)
//        .withLatestFrom(_query.stream, (_, query) => 'Results for $query')
//        .asBroadcastStream();
//  }
//
//  void dispose() {
//    _query.close();
//  }
//}