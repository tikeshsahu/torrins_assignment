import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:torrins_assignment/services/api_services/api.dart';

class MovieDetailsController extends GetxController {
  final int pageSize = 12;

  final RxBool _isFetchingDetails = RxBool(false);

  final RxMap _movieDetailsData = RxMap({});

  final RxInt _movieId = RxInt(0);

  final RxString _videoId = RxString("");

  final RxBool _isFetchingSimilarMovies = RxBool(false);

  final RxList _similarMoviesData = RxList([]);

  List get similarMoviesData => _similarMoviesData;

  bool get isFetchingSimilarMovies => _isFetchingSimilarMovies.value;

  String get videoId => _videoId.value;

  int get movieId => _movieId.value;

  Map get movieDetailsData => _movieDetailsData;

  bool get isFetchingDetails => _isFetchingDetails.value;

  @override
  void onInit() {
    if (Get.parameters["movieId"] != null) {
      _movieId.value = int.parse(Get.parameters["movieId"]!);
      getMovieDetails(movieId);
    }
    getVideoId(movieId);
    getSimilarMovies(movieId);
    super.onInit();
  }

  updateMovieDetailsData(Map value) {
    _movieDetailsData.value = value;
    update();
  }

  updateIsFetchingDetails(bool value) {
    _isFetchingDetails.value = value;
    update();
  }

  updateIsFetchingSimilarMovies(bool value) {
    _isFetchingSimilarMovies.value = value;
    update();
  }

  getMovieDetails(int movieId) async {
    try {
      updateIsFetchingDetails(true);
      final response = await Api.instance.getMovieDetails(movieId);
      _movieDetailsData.value = response;
      updateIsFetchingDetails(false);
    } catch (e) {
      updateIsFetchingDetails(false);
    }
  }

  getSimilarMovies(int movieId) async {
    try {
      updateIsFetchingSimilarMovies(true);
      final response = await Api.instance.getSimilarMovies(movieId);
      _similarMoviesData.value = response;
      updateIsFetchingSimilarMovies(false);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      updateIsFetchingSimilarMovies(false);
    }
  }

  getVideoId(int movieId) async {
    try {
      updateIsFetchingDetails(true);
      final response = await Api.instance.getYoutubeId(movieId);
      _videoId.value = response;
      updateIsFetchingDetails(false);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      updateIsFetchingDetails(false);
    }
  }
}
