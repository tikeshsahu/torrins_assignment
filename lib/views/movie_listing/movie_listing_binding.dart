



import 'package:get/get.dart';
import 'package:torrins_assignment/views/movie_listing/movie_listing_controller.dart';

class MovieListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieListingController(), fenix: true);
  }
}