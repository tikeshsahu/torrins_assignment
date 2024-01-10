



import 'package:get/get.dart';
import 'package:torrins_assignment/views/layout/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LayoutController(), fenix: true);
  }
}