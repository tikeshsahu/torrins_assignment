

import 'package:get/get.dart';
import 'package:torrins_assignment/views/movie_details/movie_details_controller.dart';

class MovieDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailsController(), fenix: true);
  }
}