import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:torrins_assignment/utils/app_constants.dart';
import 'package:torrins_assignment/views/movie_listing/movie_listing_controller.dart';
import 'package:torrins_assignment/views/movie_listing/widgets/popular_movies.dart';
import 'package:torrins_assignment/views/movie_listing/widgets/trending_movies_carousel.dart';
import 'package:torrins_assignment/views/movie_listing/widgets/upcoming_movies.dart';

class MovieListingScreen extends StatelessWidget {
  const MovieListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieListingController movieListingController = Get.put(MovieListingController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          top: true,
          bottom: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.normalPadding / 2),
            child: Column(
              children: [
                Obx(() => movieListingController.isFetchingTrendingMovies
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const TrendingMoviesCarousel()),
                const SizedBox(height: AppConstants.normalPadding),
                const PopularMovieList(),
                const SizedBox(height: AppConstants.normalPadding),
                const UpcomingMovieList()
              ],
            ),
          )),
    );
  }
}
