import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:torrins_assignment/services/api_services/api.dart';

class MovieListingController extends GetxController {
  final int pageSize = 5;

  final Rx _popularMoviesController = Rx(PagingController(firstPageKey: 1));

  final Rx _upcomingMoviesController = Rx(PagingController(firstPageKey: 1));

  final RxBool _isFetchingTrendingMovies = RxBool(false);

  final RxList _trendingMoviesData = RxList([]);

  List get trendingMoviesData => _trendingMoviesData;

  bool get isFetchingTrendingMovies => _isFetchingTrendingMovies.value;

  PagingController get popularMoviesController => _popularMoviesController.value;

  PagingController get upcomingMoviesController => _upcomingMoviesController.value;

  @override
  void onInit() {
    getTrendingMovies();
    popularMoviesController.addPageRequestListener((pageKey) {
      getPopularMovies(pageKey);
    });
    upcomingMoviesController.addPageRequestListener((pageKey) {
      getUpcomingMovies(pageKey);
    });
    super.onInit();
  }

  @override
  void dispose() {
    popularMoviesController.dispose();
    upcomingMoviesController.dispose();
    super.dispose();
  }

  updateIsFetchingTrendingMovies(bool value) {
    _isFetchingTrendingMovies.value = value;
    update();
  }

  getTrendingMovies() async {
    try {
      updateIsFetchingTrendingMovies(true);
      final response = await Api.instance.getTrendingMovies();
      _trendingMoviesData.value = response;
      updateIsFetchingTrendingMovies(false);
    } catch (e) {
      updateIsFetchingTrendingMovies(false);
    }
  }

  getPopularMovies(int pageKey) async {
    try {
      final response = await Api.instance.getPopularMovies(pageKey);
      final isLastPage = response["results"].length < pageSize;
      if (isLastPage) {
        popularMoviesController.appendLastPage(response["results"]);
      } else {
        int nextPageKey = pageKey + 1;
        popularMoviesController.appendPage(
          response["results"],
          nextPageKey,
        );
      }
    } catch (e) {
      popularMoviesController.error = e;
    }
  }

  getUpcomingMovies(int pageKey) async {
    try {
      final response = await Api.instance.getUpcomingMovies(pageKey);
      final isLastPage = response["results"].length < pageSize;
      if (isLastPage) {
        upcomingMoviesController.appendLastPage(response["results"]);
      } else {
        int nextPageKey = pageKey + 1;
        upcomingMoviesController.appendPage(
          response["results"],
          nextPageKey,
        );
      }
    } catch (e) {
      upcomingMoviesController.error = e;
    }
  }
}
