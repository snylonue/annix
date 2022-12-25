import 'package:annix/global.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkService extends ChangeNotifier {
  static bool isMobile = false;
  static bool isConnected = true;

  final Connectivity _connectivity = Connectivity();
  final Dio _client = Dio();

  NetworkService() {
    _connectivity.onConnectivityChanged.listen(_updateState);
    _connectivity.checkConnectivity().then(_updateState);
    Global.settings.useMobileNetwork.addListener(notifyListeners);
  }

  void _updateState(ConnectivityResult result) {
    isConnected = true;
    isMobile = false;
    notifyListeners();
  }

  Future<bool> _canVisitInternet() async {
    try {
      // Check network connection
      // We used `InternetAddress.lookup` before, but it could be influenced by fakeip
      final response =
          await _client.getUri(Uri.parse('http://g.cn/generate_204'));
      if (response.statusCode == 204) {
        return true;
      }
    } catch (_) {}
    return false;
  }

  static bool get isOnline {
    return isConnected && (!isMobile || Global.settings.useMobileNetwork.value);
  }
}
