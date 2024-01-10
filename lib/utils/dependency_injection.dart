import 'package:get/get.dart';
import 'package:torrins_assignment/services/network_connectivity/network_connectivity_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}