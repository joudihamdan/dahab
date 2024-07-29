// connectivity_controller.dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  var isConnected = false.obs;
  final Connectivity _connectivity = Connectivity();
  late ConnectivityResult _connectivityResult;

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnectivity();
    _connectivity.onConnectivityChanged.listen((results) {
      _updateConnectionStatus(results.first);
    });
  }

  Future<void> _checkInitialConnectivity() async {
    _connectivityResult = (await _connectivity.checkConnectivity())[0];
    _updateConnectionStatus(_connectivityResult);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile) {
      isConnected.value = true;
      } else if (result == ConnectivityResult.wifi) {
        isConnected.value = true;
        } 
        else if (result == ConnectivityResult.ethernet) {
      isConnected.value = true;
    } else {
          isConnected.value = false;
        }
        print(result);
    // isConnected.value = result != ConnectivityResult.none;
  }
}
