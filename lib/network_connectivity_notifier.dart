import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkConnectivityNotifier extends ChangeNotifier {
  bool _isOnline = false;
  final Connectivity _connectivity = Connectivity();

  bool get isOnline => _isOnline;

  NetworkConnectivityNotifier() {
    _initConnectivity();
    _setupConnectivityStream();
  }

  Future<void> _initConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(result);
    } catch (e) {
      debugPrint('Failed to get connectivity status: $e');
    }
  }

  void _setupConnectivityStream() {
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      _updateConnectionStatus(result);
    });
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    _isOnline = !result.contains(ConnectivityResult.none);
    notifyListeners();
  }
}
