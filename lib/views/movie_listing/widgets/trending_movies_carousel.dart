import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:torrins_assignment/routes/app_routes.dart';
import 'package:torrins_assignment/utils/app_constants.dart';
import 'package:torrins_assignment/views/movie_listing/movie_listing_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TrendingMoviesCarousel extends StatelessWidget {
  const TrendingMoviesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieListingController movieListingController = Get.find();
    final Size size = MediaQuery.of(context).size;
    return CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          height: size.height * 0.35,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {},
        ),
        items: movieListingController.trendingMoviesData.map((item) {
          return GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.movieDetailsRoute, parameters: {"movieId": item["id"].toString()}),
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        // fromLTRB
                        Colors.transparent,
                        Colors.black,
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [0, 0.3, 0.5, 1],
                    ).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: CachedNetworkImage(
                    height: size.height * 0.35,
                    width: double.infinity,
                    imageUrl: "${AppConstants.imageBase}${item["backdrop_path"]}",
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          item["title"],
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList());
  }
}
