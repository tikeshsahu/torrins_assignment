


import 'package:get/get.dart';
import 'package:torrins_assignment/views/downloads/downloads_controller.dart';
import 'package:torrins_assignment/views/downloads/downloads_screen.dart';
import 'package:torrins_assignment/views/movie_listing/movie_listing_controller.dart';
import 'package:torrins_assignment/views/movie_listing/movie_listing_screen.dart';

class LayoutController extends GetxController {

  final bodyPages = [const MovieListingScreen(), const DownloadsScreen()];
  final RxInt _currentIndex = RxInt(0);

  // getter
  int get currentIndex => _currentIndex.value;

  changeIndex(int value) {
    _currentIndex.value = value;
    if (value == 0) {
      Get.delete<DownloadController>();
    } else {
      Get.delete<MovieListingController>();
    }
    update();
  }
}