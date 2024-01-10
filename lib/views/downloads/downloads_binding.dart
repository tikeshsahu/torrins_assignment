



import 'package:get/get.dart';
import 'package:torrins_assignment/views/downloads/downloads_controller.dart';

class DownloadsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DownloadController(), fenix: true);
  }
}