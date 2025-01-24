import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/services/sync.dart';

class NetworkConnectivityService {
  bool _isOnline = false;
  final Connectivity _connectivity = Connectivity();
  final SynchronizationCenter syncCenter;

  bool get isOnline => _isOnline;

  NetworkConnectivityService({required this.syncCenter}) {
    _initConnectivity();
    _setupConnectivityStream();
  }

  Future<void> _initConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(!result.contains(ConnectivityResult.none));
    } catch (e) {
      debugPrint('Failed to get connectivity status: $e');
    }
  }

  void _setupConnectivityStream() {
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      final isOnline = !result.contains(ConnectivityResult.none);
      if (isOnline) {
        await syncCenter.syncFromLocalToRemote();
      }
      _updateConnectionStatus(isOnline);
    });
  }

  void _updateConnectionStatus(bool isOnline) {
    _isOnline = isOnline;
    // Notify listeners or other parts of the app if needed
  }
}
